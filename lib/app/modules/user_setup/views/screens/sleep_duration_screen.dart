import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/user_setup/controllers/sleep_duration_controller.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_progress_bar.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_step_text.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_title_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/modules/widgets/others/bottom_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/expanded_button.dart';
import 'package:iconsax/iconsax.dart';

class SleepDurationScreen extends GetView<SleepDurationController> {
  const SleepDurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = AHelperFunction.isDarkMode(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Iconsax.arrow_left),
          title: UserSetupProgressBar(currentStep: 1),
          actions: [UserSetupStepText(currentStep: 1)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(height: 10),
              UserSetupTitleSubtitleWidget(
                firstText: AppStrings.howLongDoYouUsually,
                secondText: AppStrings.sleep,
                thirdText: AppStrings.atNight,
                subtitle: AppStrings.sleepSubtitle,
              ),

              SizedBox(height: AppSpacing.xxl),

              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: AppSpacing.lg),
                  itemCount: controller.options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final option = controller.options[index];
                    return GestureDetector(
                      onTap: () => controller.changeSelectedIndex(index),
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 17,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: controller.selectedIndex.value == index
                                  ? AppColors.primary
                                  : isDark
                                  ? AppColors.darkSecondaryColor
                                  : AppColors.borderColor,

                              width: 2.0,
                            ),
                            color: isDark
                                ? AppColors.containerBackgroundColor
                                : AppColors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                option['emoji'] as String,
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                option['label'] as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomWidget(
          child: ExpandedButton(
            text: AppStrings.continueText,
            onPressed: () => Get.toNamed(AppRoutes.wakeTime),
          ),
        ),
      ),
    );
  }
}
