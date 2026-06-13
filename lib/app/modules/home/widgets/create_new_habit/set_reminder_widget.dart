import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/validation.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/switch_plus_title.dart';
import 'package:habitly/app/modules/widgets/text_field/date_time_field_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/reminder_data.dart';

class SetReminderWidget extends StatelessWidget {
  final ReminderData reminder;
  final ValueChanged<bool> onReminderChanged;
  final bool shouldValidate;

  const SetReminderWidget({
    super.key,
    required this.reminder,
    required this.onReminderChanged,
    this.shouldValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegularHabitController.instance;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchPlusTitle(
            isSelected: reminder.isEnabled.value,
            title: strSetReminder,
            onChanged: onReminderChanged,
          ).paddingOnly(bottom: AppSpacing.bf),

          if (reminder.isEnabled.value)
            DateTimeFieldWidget(
              controller: reminder.controller,
              validator: (value) =>
                  AValidator.validateDateTimeField(
                    shouldValidate: shouldValidate,
                    value: value,
                    defaultText: strPleaseSelectReminderTime,
                  ),
              onTap: () =>
                  controller.showTimePickerDialog(
                    context,
                    reminder,
                  ),
              prefixIcon: Iconsax.clock,
              suffixIcon: Iconsax.edit_2,
            ),
        ],
      ).paddingOnly(
        left: width_20,
        right: width_20,
        top: height_24,
      ),
    );
  }
}
