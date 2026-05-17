import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/validation.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
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

  /// Repeat type [daily, monthly, weekly]
  Widget get getWhenOrRegularWidget {
    if (isRegularHabit) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Repeat type Widget
          const RepeatTypeWidget(),

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
    final regularController = RegularHabitController.instance;
    final habitTextControllerName = isRegularHabit ? strHabitName : strTaskName;

    return SingleChildScrollView(
      child: Form(
        key: isRegularHabit
            ? controller.regularFormKey
            : controller.oneTimeFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// habit text title field
            PrimaryTextFieldAndLabel(
              isRequired: true,
              validator: (value) =>
                  AValidator.validateEmptyText(habitTextControllerName, value),
              title: habitTextControllerName,
              controller: regularController.habitController,
            ).paddingSymmetric(horizontal: 20.w),

            AppGaps.section,

            /// Icon section title + "View All" button
            const ScreenSectionTitleAndActionWidget().paddingSymmetric(
              horizontal: 20.w,
            ),

            AppGaps.field,

            /// Icons horizontal list
            const IconRowWidget().paddingOnly(left: 20.w),

            /// Color Section
            const ColorSection(),

            /// when or regular [WIDGET]
            getWhenOrRegularWidget,

            /// Do it at
            const DoItAtWidget(),

            /// END HABIT ON
            if (isRegularHabit)
              const EndHabitOnWidget().paddingOnly(
                left: AppSpacing.bf,
                right: AppSpacing.bf,
                top: AppSpacing.xxl,
              ),

            /// set reminder
            Obx(() {
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
            }),
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
