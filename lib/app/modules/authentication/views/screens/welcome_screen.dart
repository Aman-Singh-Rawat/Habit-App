import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/constants/image_strings.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/authentication/controllers/welcome_controller.dart';
import 'package:habitly/app/modules/authentication/views/widgets/privacy_policy_and_terms_of_use_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';
import 'package:habitly/app/modules/widgets/buttons/social_button_widget.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AHelperFunction.isDarkMode(context);
    controller;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: kToolbarHeight + 20),

              /// app logo
              Image.asset(
                ImageStrings.imageBlueLogo,
                width: 110,
                height: 110,
                fit: BoxFit.contain,
                color: AppColors.primary,
              ),

              const SizedBox(height: 30),

              /// get started text [TITLE]
              Text(
                AppStrings.letsGetStarted,
                textAlign: TextAlign.center,
                style: AppTextStyles.onboardingTitle.copyWith(
                  color: context.onboardingTitleColor,
                ),
              ),

              SizedBox(height: AppSpacing.md),

              // subtitle
              Text(
                AppStrings.letsDiveInInto,
                textAlign: TextAlign.center,
                style: AppTextStyles.onboardingSubtitle.copyWith(
                  color: context.onboardingSubtitleColor,
                ),
              ),

              const SizedBox(height: 40),

              /// [Social Buttons]

              /// Google
              SocialButton(
                iconPath: ImageStrings.icGoogle,
                buttonText: AppStrings.continueWithGoogle,
                onPressed: () {},
              ),

              SizedBox(height: AppSpacing.md),

              /// Apple
              SocialButton(
                iconPath: ImageStrings.icApple,
                buttonText: AppStrings.continueWithApple,
                onPressed: () {},
                iconColor: isDark ? AppColors.white : null,
              ),

              SizedBox(height: AppSpacing.md),

              /// facebook
              SocialButton(
                iconPath: ImageStrings.icFacebook,
                buttonText: AppStrings.continueWithFacebook,
                onPressed: () {},
              ),

              SizedBox(height: AppSpacing.md),

              /// twitter
              SocialButton(
                iconPath: ImageStrings.icTwitter,
                buttonText: AppStrings.continueWithTwitter,
                onPressed: () {},
              ),

              const SizedBox(height: 40),

              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: AppStrings.signUp,
                      onClick: () => Get.toNamed(AppRoutes.signUp),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: AppStrings.signIn,
                      onClick: () => Get.toNamed(AppRoutes.signIn),
                      textColor: isDark ? AppColors.white : AppColors.primary,
                      backgroundColor: isDark
                          ? AppColors.darkSecondaryColor
                          : AppColors.primaryLight,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 45),

              PrivacyPolicyAndTermsOfUseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
