import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/secondary_button_text.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';

class OnboardingBottomWidget extends StatelessWidget {
  const OnboardingBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = AHelperFunction.isDarkMode(context);
    final OnboardingController controller = OnboardingController.instance;
    return Container(
      width: double.infinity,
      color: isDark ? AppColors.darkScaffoldBacgroundColor : AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => controller.currentPageIndex.value < 2
                  ? Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            buttonText: AppStrings.skip,
                            onClick: controller.onSkip,
                            textColor: context.secondaryButtonTextColor,
                            backgroundColor: context.secondaryBackgroundColor,
                          ),
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: CustomElevatedButton(
                            buttonText: AppStrings.continueText,
                            onClick: controller.onNextPage,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            buttonText: AppStrings.letsGetStarted,
                            onClick: () => Get.toNamed(AppRoutes.welcome),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
