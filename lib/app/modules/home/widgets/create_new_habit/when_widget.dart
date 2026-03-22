import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/secondary_button_text.dart';
import 'package:habitly/app/core/theme/validation.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/custom_calendar_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/end_habit_on_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';
import 'package:habitly/app/modules/widgets/text_field/date_time_field_widget.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';
import 'package:iconsax/iconsax.dart';

class WhenWidget extends StatelessWidget {
  const WhenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(text: AppStrings.when).paddingOnly(bottom: AppSpacing.lg),
        DateTimeFieldWidget(
          controller: controller.whenController,
          validator: AValidator.validateDate,
          onTap: () => showCalendarBottomSheet(
            context: context,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Obx(
                    () => buildCalendar(
                      context: context,
                      showHeader: true,
                      firstDay: DateTime.now(),
                      focusedDay: controller.whenFocusedDay.value,
                      selectedDayPredicate:
                          controller.onWhenSelectedDayPredicate,
                      onDaySelected: controller.onWhenSingleDaySelected,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        buttonText: AppStrings.cancel,
                        onClick: controller.handleWhenOnCancelClick,
                        textColor: context.secondaryButtonTextColor,
                        backgroundColor: context.secondaryBackgroundColor,
                      ),
                    ),
                    const SizedBox(width: 17),
                    Expanded(
                      child: CustomElevatedButton(
                        buttonText: AppStrings.ok,
                        onClick: controller.handleWhenWidgetDateOnOkClick,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          prefixIcon: Iconsax.calendar_tick4,
          suffixIcon: Iconsax.edit_2,
        ),
      ],
    );
  }
}
