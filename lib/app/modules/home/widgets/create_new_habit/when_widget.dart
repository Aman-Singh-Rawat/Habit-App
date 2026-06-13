import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/secondary_button_text.dart';
import 'package:habitly/app/core/theme/validation.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/custom_calendar_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/end_habit_on_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';
import 'package:habitly/app/modules/widgets/text_field/date_time_field_widget.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/bottom_seets/show_calendar_bottom_sheet.dart';
import '../../../widgets/others/build_calendar.dart';

/// TODO:: fix this
class WhenWidget extends StatelessWidget {
  const WhenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegularHabitController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// section title
        SectionTitle(
          text: AppStrings.when,
          isRequired: true,
        ).paddingOnly(bottom: AppSpacing.lg),

        /// text_field
        DateTimeFieldWidget(
          controller: controller.whenController,
          validator: AValidator.validateDate,
          onTap: () => controller.onWhenCalendarTFClick(context),
          prefixIcon: Iconsax.calendar_tick4,
          suffixIcon: Iconsax.edit_2,
        ),
      ],
    ).paddingOnly(
      left: AppSpacing.bf,
      right: AppSpacing.bf,
      top: AppSpacing.xl,
    );
  }
}
