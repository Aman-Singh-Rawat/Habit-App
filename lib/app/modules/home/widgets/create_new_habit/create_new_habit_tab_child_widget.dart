import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/validation.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/color_section.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/do_it_at.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/end_habit_on_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/repeat_content_section.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/repeat_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/set_reminder_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/when_widget.dart';
import 'package:habitly/app/modules/home/widgets/icon_horizontal_list.dart';
import 'package:habitly/app/modules/widgets/text_field/primary_text_field_and_label.dart';
import 'package:habitly/app/modules/widgets/texts/screen_section_title_and_action_widget.dart';

class CreateNewHabitTabChildWidget extends StatelessWidget {
  final bool isRegularHabit;

  const CreateNewHabitTabChildWidget({super.key, required this.isRegularHabit});

  Widget get getWhenOrRegularWidget {
    if (isRegularHabit) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Repeat Widget
          RepeatWidget(),

          // Repeat Content Widget
          RepeatContentSection(),
        ],
      );
    } else {
      // When Widget
      return WhenWidget().paddingOnly(
        left: AppSpacing.bf,
        right: AppSpacing.bf,
        top: AppSpacing.xl,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return SingleChildScrollView(
      child: Form(
        key: isRegularHabit
            ? controller.regularFormKey
            : controller.oneTimeFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryTextFieldAndLabel(
              validator: (value) =>
                  AValidator.validateEmptyText(
                    isRegularHabit ? 'Habit Name' : 'Task Name',
                    value,
                  ),
              title: isRegularHabit
                  ? AppStrings.habitName
                  : AppStrings.taskName,
              controller: isRegularHabit
                  ? controller.habitController
                  : controller.taskController,
            ).paddingSymmetric(horizontal: 20.w),

            SizedBox(height: AppSpacing.xxl),

            // icon text =====> View All
            ScreenSectionTitleAndActionWidget().paddingSymmetric(
              horizontal: 20.w,
            ),

            SizedBox(height: AppSpacing.lg),

            /// icon listview
            iconHorizontalListWidget(),

            /// Color Section
            ColorSection(),

            /// when or regular [WIDGET]
            getWhenOrRegularWidget,

            // do it at
            DoItAtWidget(),

            // end habit on
            if (isRegularHabit)
              EndHabitOnWidget().paddingOnly(
                left: AppSpacing.bf,
                right: AppSpacing.bf,
                top: AppSpacing.xxl,
              ),

            // set reminder
            Obx(
                  () {
                return SetReminderWidget(
                  shouldValidate: isSwitchSelected,
                  isSwitchSelected: isRegularHabit
                      ? controller.setRegularReminder.value
                      : controller.setOneTimeRegularReminder.value,
                  textEditingController: isRegularHabit
                      ? controller.setReminderHabitTimeController
                      : controller.setReminderTaskTimeController,
                  onReminderChanged: isRegularHabit
                      ? controller.onSetReminder
                      : controller.onOneTimeSetReminder,
                );
              },
            ),
          ],
        ).paddingOnly(top: 25.h),
      ),
    );
  }

  bool get isSwitchSelected {
    final controller = CreateNewHabitController.instance;
    if (isRegularHabit && controller.setRegularReminder.value) {
      return true;
    } else if (controller.setOneTimeRegularReminder.value) {
      return true;
    } else {
      return false;
    }
  }
}
