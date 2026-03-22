import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/validation.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/switch_plus_title.dart';
import 'package:habitly/app/modules/widgets/text_field/date_time_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class SetReminderWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isSwitchSelected;
  final Function(bool value) onReminderChanged;
  final bool shouldValidate;

  const SetReminderWidget({
    super.key,
    required this.textEditingController,
    required this.isSwitchSelected,
    required this.onReminderChanged,
    this.shouldValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchPlusTitle(
          isSelected: isSwitchSelected,
          title: AppStrings.setReminder,
          onChanged: onReminderChanged,
        ).paddingOnly(bottom: AppSpacing.bf),

        if (isSwitchSelected)
          DateTimeFieldWidget(
            controller: textEditingController,
            validator: (value) => AValidator.validateDateTimeField(
              shouldValidate: shouldValidate,
              value: value,
              defaultText: strPleaseSelectReminderTime,
            ),
            onTap: () =>
                controller.showTimePickerDialog(context, textEditingController),
            prefixIcon: Iconsax.clock,
            suffixIcon: Iconsax.edit_2,
          ),
      ],
    ).paddingOnly(left: 20.w, right: 20.w, top: AppSpacing.xl);
  }
}
