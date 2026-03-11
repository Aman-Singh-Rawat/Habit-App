// 2. Reusable dialog widget — now StateLESS
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/modules/mood_stat/widgets/month_picker_header.dart';
import 'package:habitly/app/modules/mood_stat/widgets/month_year_picker_actions.dart';

import '../../core/constants/app_lists.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/others/year_selector.dart';
import 'controllers/month_year_picker_controller.dart';

class MonthYearPickerDialog extends StatelessWidget {
  final DateTime initialDate;
  final Function(DateTime) onConfirm;

  const MonthYearPickerDialog({
    super.key,
    required this.initialDate,
    required this.onConfirm,
  });

  // Static helper to show the dialog anywhere
  static void show({
    required DateTime initialDate,
    required Function(DateTime) onConfirm,
  }) {
    Get.dialog(
      MonthYearPickerDialog(initialDate: initialDate, onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scoped controller — auto disposed when dialog closes
    final controller = Get.put(
      MonthYearPickerController(onConfirm: onConfirm)
        ..selectedYear.value = initialDate.year
        ..selectedMonth.value = initialDate.month,
      tag: 'month_year_picker',
    );

    final theme = Theme.of(context);
    final months = AppLists.monthsShort;

    return FadeTransition(
      opacity: controller.fadeAnim,
      child: ScaleTransition(
        scale: controller.scaleAnim,
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
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Header ──────────────────────────────────────
                Obx(
                  () => MonthPickerHeader(
                    months: months,
                    selectedMonth: controller.selectedMonth.value,
                    selectedYear: controller.selectedYear.value,
                    theme: theme,
                  ),
                ),

                // ── Year Selector ────────────────────────────────
                Obx(
                  () => YearSelector(
                    selectedYear: controller.selectedYear.value,
                    onLeftClick: controller.decrementYear,
                    onRightClick: controller.incrementYear,
                  ),
                ),

                // ── Month Grid ───────────────────────────────────
                _monthGrid(controller),

                // ── Actions ──────────────────────────────────────
                MonthYearPickerActions(controller: controller, theme: theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _monthGrid(MonthYearPickerController controller) {
    final theme = Theme.of(Get.context!);
    return Padding(
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
          return Obx(() {
            final monthNum = index + 1;
            final isSelected = monthNum == controller.selectedMonth.value;
            final isFuture = controller.isFutureMonth(monthNum);
            final isToday = controller.isToday(monthNum);
            return MonthYearPickerMonthItem(
              onClick: () => controller.selectMonth(monthNum),
              color: isSelected
                  ? AppColors.primaryDark
                  : isToday
                  ? theme.colorScheme.primary.withOpacity(0.08)
                  : Colors.transparent,
              monthText: AppLists.monthsShort[index],
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              monthColor: isSelected
                  ? Colors.white
                  : isFuture
                  ? theme.hintColor.withOpacity(0.35)
                  : theme.textTheme.bodyMedium?.color,
            );
          });
        },
      ),
    );
  }
}

class MonthYearPickerMonthItem extends StatelessWidget {
  final VoidCallback onClick;
  final Color color;
  final Border? border;
  final FontWeight fontWeight;
  final String monthText;
  final Color? monthColor;

  const MonthYearPickerMonthItem({
    super.key,
    required this.onClick,
    required this.color,
    this.border,
    required this.fontWeight,
    required this.monthText,
    this.monthColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: border,
        ),
        alignment: Alignment.center,
        child: Text(
          monthText,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: fontWeight,
            color: monthColor,
          ),
        ),
      ),
    );
  }
}
