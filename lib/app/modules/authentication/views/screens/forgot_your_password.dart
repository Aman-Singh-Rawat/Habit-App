import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/modules/authentication/controllers/forgot_password_controller.dart';
import 'package:habitly/app/modules/widgets/others/bottom_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/expanded_button.dart';
import 'package:habitly/app/modules/widgets/text_field/primary_text_field_and_label.dart';
import 'package:iconsax/iconsax.dart';

class ForgotYourPassword extends GetView<ForgotPasswordController> {
  const ForgotYourPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(leading: Icon(Iconsax.arrow_left)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // forgot title
              Text(
                AppStrings.forgotPasswordTitle,
                textAlign: TextAlign.start,
                style: AppTextStyles.onboardingTitle.copyWith(
                  color: context.onboardingTitleColor,
                ),
              ),

              SizedBox(height: AppSpacing.sm),

              // forgot subtitle
              Text(
                AppStrings.forgotPasswordSubtitle,
                textAlign: TextAlign.start,
                style: AppTextStyles.onboardingSubtitle.copyWith(
                  color: context.onboardingSubtitleColor,
                ),
              ),

              const SizedBox(height: 25),

              /// [FORM]
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // email
                    PrimaryTextFieldAndLabel(
                      title: AppStrings.yourRegisteredEmail,
                      controller: controller.email,
                      icon: Icons.mail_outline_rounded,
                    ),

                    SizedBox(height: AppSpacing.bf),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomWidget(
          child: Obx(
            () => ExpandedButton(
              text: AppStrings.sendOtpCode,
              onPressed: controller.isFieldEmpty.value
                  ? null
                  : controller.sendOtpCode,
            ),
          ),
        ),
      ),
    );
  }
}
