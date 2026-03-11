import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/user_setup/controllers/end_day_time_controller.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/time_picker.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_progress_bar.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_step_text.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_title_subtitle_widget.dart';
import 'package:habitly/app/modules/widgets/others/bottom_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/expanded_button.dart';
import 'package:iconsax/iconsax.dart';

class EndDayTimeViewScreen extends GetView<EndDayTimeController> {
  const EndDayTimeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Iconsax.arrow_left),
          title: UserSetupProgressBar(currentStep: 3),
          actions: [UserSetupStepText(currentStep: 3)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(height: 10),
              UserSetupTitleSubtitleWidget(
                firstText: AppStrings.whatTimeDoYouUsually,
                secondText: AppStrings.endYourDay,
                thirdText: AppStrings.endYourDayQuestionMark,
                subtitle: AppStrings.endDaySubtitle,
              ),

              const SizedBox(height: AppSpacing.xl),

              Obx(
                () => ATimePicker(
                  hourValue: controller.hour.value,
                  minuteValue: controller.minute.value,
                  onHourChange: (int value) => controller.hour.value = value,
                  onMinuteChange: (int value) =>
                      controller.minute.value = value,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomWidget(
          child: ExpandedButton(
            text: AppStrings.continueText,
            onPressed: () => Get.toNamed(AppRoutes.procrastination),
          ),
        ),
      ),
    );
  }
}
