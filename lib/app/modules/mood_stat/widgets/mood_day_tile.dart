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
import 'mood_bottom_sheet_widget.dart';

class MoodDayTile extends StatelessWidget {
  final MoodCalendar? mood;
  final DateTime? moodDate;

  const MoodDayTile({super.key, this.mood, this.moodDate});

  /// -------- DATE HELPERS --------

  DateTime get _today => normalizeDate(DateTime.now());

  DateTime get _date => normalizeDate(mood?.date ?? moodDate!);

  bool get _isToday => _date == _today;

  bool get _isPast => _date.isBefore(_today);

  bool get _hasMood => mood != null;

  /// -------- UI TEXT --------

  String get moodTitle {
    if (_hasMood) return mood!.label;
    if (_isPast && !_isToday) return strMissed;
    if (_isToday) return strToday;
    return strMood;
  }

  /// -------- COLORS --------

  Color get iconColor {
    if (_hasMood) {
      return AppColors.darkSecondaryTextColor;
    }

    if (_isToday) {
      return AppColors.chetwode.s500;
    }

    if (_isPast && !_isToday) {
      return AppColors.moodDarkEmptyIconColor;
    }

    return AppColors.moodDarkEmptyIconColor;
  }

  Color get borderColor {
    if (_isToday) {
      return AppColors.chetwode.s500;
    }

    if (_isPast && !_isToday) {
      return AppColors.moodDarkEmptyIconColor;
    }

    return AppColors.moodDarkEmptyIconColor;
  }

  /// -------- ICON --------

  IconData get icon {
    if (_isToday || _isPast) {
      return Icons.add;
    }
    return Icons.emoji_emotions_outlined;
  }

  /// -------- DAY NUMBER --------

  int get dayNumber => mood?.date.day ?? moodDate!.day;

  /// -------- UI --------

  @override
  Widget build(BuildContext context) {
    final controller = MoodStatController.instance;

    return GestureDetector(
      onTap: () => showCalendarBottomSheet(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSpacing.sm.h),

            Text(
              strHowIsYourMoodToday,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
            ),

            Divider().paddingSymmetric(vertical: AppSpacing.bf.h),
            Expanded(
              child: Wrap(
                spacing: 32,
                runSpacing: 36,
                alignment: WrapAlignment.center,
                children: List.generate(AppLists.moodList.length, (index) {
                  final moodItem = AppLists.moodList[index];

                  return Obx(
                    () => MoodBottomSheetWidget(
                      emoji: moodItem.emoji,
                      title: moodItem.title,
                      isSelected: controller.selectedMoodIndex.value == index,
                      onTap: () {
                        controller.selectedMoodIndex.value = index;
                      },
                    ),
                  );
                }),
              ),
            ),

            Divider().paddingOnly(bottom: AppSpacing.lg),

            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                buttonText: AppStrings.continueText,
                onClick: () {},
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 42.w,
            height: 42.w,
            child: Center(
              child: _hasMood
                  ? Text(mood!.emoji, style: TextStyle(fontSize: 29.sp))
                  : Container(
                      width: 34.w,
                      height: 34.w,
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2.w),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(icon, size: 20.w, color: iconColor),
                      ),
                    ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            moodTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9.sp, height: 1.1, color: iconColor),
          ),

          const SizedBox(height: 4),

          Text(
            dayNumber.toString(),
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
