import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/dialogs/mood_dialog.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/utils/helpers/DateClass.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/end_habit_on_widget.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';
import 'package:habitly/app/modules/widgets/container/custom_card.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_lists.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/calendar_table_style.dart';
import '../../../core/theme/days_of_week_style.dart';
import '../../widgets/appbar/leading_app_bar_image_widget.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../models/mood.dart';
import '../models/mood_calendar.dart';
import '../widgets/mood_day_tile.dart';

class MoodStatScreen extends GetView<MoodStatController> {
  const MoodStatScreen({super.key});

  // showing Month and year let suppose [March 2026] and also left <-> right date selection
  Widget _customCalendarHeaderView() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left_rounded),
            // onPressed: controller.previousMonth,
            onPressed: showMonthPicker,
          ),
          GestureDetector(
            onTap: controller.funShowMonthYearPicker,
            child: Text(
              DateClass.formatMonthYear(controller.selectedMonth.value),
              style: Theme.of(
                Get.context!,
              ).textTheme.headlineSmall!.copyWith(fontSize: 16.sp),
            ),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right_rounded),
            onPressed: controller.nextMonth,
          ),
        ],
      ),
    );
  }

  Widget _weekdayHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) => Expanded(
          child: Center(
            child: Text(
              AppLists.weeklyDay3Char[index].substring(0, 2),
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        centerTitle: true,
        leading: LeadingAppBarImageWidget(),
        title: Text(AppStrings.moodStat),
        actions: const [Icon(Icons.history)],
      ),
      body: SingleChildScrollView(
        child: CustomCard(
          child:
              Column(
                children: [
                  /// calendar header [left, right btn, month name]
                  _customCalendarHeaderView(),

                  // Divider
                  Divider().paddingOnly(bottom: AppSpacing.md),

                  /// weekday [Mo, Tu, We, Th, Fr, Sa, Su]
                  _weekdayHeader().paddingOnly(bottom: AppSpacing.lg),

                  /// calendar view [EMOJI, DATES]
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 90,
                          ),
                      itemCount:
                          controller.daysInMonth.value +
                          controller.firstWeekday.value -
                          1,
                      itemBuilder: (context, index) {
                        int day = index - controller.firstWeekday.value + 2;

                        final date = DateTime(
                          controller.selectedMonth.value.year,
                          controller.selectedMonth.value.month,
                          day,
                        );
                        final normalizedDate = normalizeDate(date);

                        final mood = controller.moodMap[normalizedDate];

                        if (mood != null) {
                          return MoodDayTile(mood: mood);
                        } else {
                          return MoodDayTile(moodDate: date);
                        }
                      },
                    ),
                  ),
                ],
              ).paddingOnly(
                left: AppSpacing.sm,
                right: AppSpacing.sm,
                bottom: AppSpacing.lg,
                top: AppSpacing.sm,
              ),
        ).paddingSymmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      ),
    );
  }
}

void showMonthPicker() {
  final controller = Get.find<MoodStatController>();

  showDialog(
    context: Get.overlayContext!,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (_) {
      return _MonthYearPickerDialog(controller: controller);
    },
  );
}

class _MonthYearPickerDialog extends StatefulWidget {
  final MoodStatController controller;

  const _MonthYearPickerDialog({required this.controller});

  @override
  State<_MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<_MonthYearPickerDialog>
    with SingleTickerProviderStateMixin {
  late int selectedYear;
  late int selectedMonth;
  late AnimationController _animController;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    final current = widget.controller.selectedMonth.value;
    selectedYear = current.year;
    selectedMonth = current.month;

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _scaleAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _confirm() {
    widget.controller.selectedMonth.value = DateTime(
      selectedYear,
      selectedMonth,
    );
    Navigator.of(Get.overlayContext!).pop();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final theme = Theme.of(context);
    final months = AppLists.monthsShort;

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.containerBackgroundColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Header ──────────────────────────────────────────
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 12.w, 16.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.dividerColor.withOpacity(0.12),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            strSelectMonth,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 8.sp,
                              letterSpacing: 1.4,
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xl),
                          Text(
                            '${months[selectedMonth - 1]} $selectedYear',
                            style: theme.textTheme.headlineMedium
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── Year Selector ────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _YearArrowButton(
                        icon: Icons.chevron_left_rounded,
                        onTap: () => setState(() => selectedYear--),
                      ),
                      GestureDetector(
                        onTap: () {}, // optional: open full year picker
                        child: Text(
                          '$selectedYear',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      _YearArrowButton(
                        icon: Icons.chevron_right_rounded,
                        onTap: selectedYear >= now.year
                            ? null
                            : () => setState(() => selectedYear++),
                      ),
                    ],
                  ),
                ),

                // ── Month Grid ───────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 16.h),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 6.w,
                      mainAxisSpacing: 6.h,
                    ),
                    itemCount: 12,
                    itemBuilder: (_, index) {
                      final monthNum = index + 1;
                      final isSelected = monthNum == selectedMonth;
                      final isFuture =
                          selectedYear == now.year && monthNum > now.month;
                      final isToday =
                          monthNum == now.month && selectedYear == now.year;

                      return GestureDetector(
                        onTap: isFuture
                            ? null
                            : () => setState(() => selectedMonth = monthNum),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          curve: Curves.easeOut,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : isToday
                                ? theme.colorScheme.primary.withOpacity(0.08)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                            border: isToday && !isSelected
                                ? Border.all(
                                    color: theme.colorScheme.primary
                                        .withOpacity(0.35),
                                    width: 1.2,
                                  )
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            months[index],
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 12.sp,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : isFuture
                                  ? theme.hintColor.withOpacity(0.35)
                                  : theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ── Actions ──────────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 46.h,
                          child: TextButton(
                            onPressed: () =>
                                Navigator.of(Get.overlayContext!).pop(),
                            style: TextButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              strCancel,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 46.h,
                          child: FilledButton(
                            onPressed: _confirm,
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              strConfirm,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Reusable arrow button ─────────────────────────────────────────────────────
class _YearArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _YearArrowButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: disabled
              ? Colors.transparent
              : theme.colorScheme.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 22.sp,
          color: disabled
              ? theme.hintColor.withOpacity(0.3)
              : theme.colorScheme.primary,
        ),
      ),
    );
  }
}
