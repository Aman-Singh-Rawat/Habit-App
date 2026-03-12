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
import 'package:habitly/app/modules/mood_stat/widgets/calendar_view.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';
import 'package:habitly/app/modules/widgets/container/custom_card.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_lists.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/calendar_table_style.dart';
import '../../../core/theme/days_of_week_style.dart';
import '../../widgets/appbar/leading_app_bar_image_widget.dart';
import '../../widgets/buttons/custom_arrow_Button.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/others/year_selector.dart';
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
            onPressed: controller.previousMonth,
          ),
          GestureDetector(
            onTap: controller.showMonthYearPicker,
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

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 48.w,
      centerTitle: true,
      leading: LeadingAppBarImageWidget(),
      title: Text(AppStrings.moodStat),
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.moodStatHistory),
          child: const Icon(Icons.history_rounded),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
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
                MoodCalendarView(),
              ],
            ).paddingOnly(
              left: AppSpacing.sm,
              right: AppSpacing.sm,
              bottom: AppSpacing.lg,
              top: AppSpacing.sm,
            ),
      ).paddingSymmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
    );
  }

  Widget _mainView() {
    return Scaffold(appBar: _appBar(), body: _bodyWidget());
  }

  @override
  Widget build(BuildContext context) {
    return _mainView();
  }
}
