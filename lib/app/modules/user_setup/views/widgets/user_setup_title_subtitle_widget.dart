import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class UserSetupTitleSubtitleWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  final String subtitle;
  const UserSetupTitleSubtitleWidget({
    super.key,
    required this.subtitle,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          style: AppTextStyles.onboardingTitle.copyWith(
            color: context.onboardingTitleColor,
          ),
          TextSpan(
            text: firstText,

            children: [
              // colorful text
              TextSpan(
                text: secondText,
                style: AppTextStyles.onboardingTitle.copyWith(
                  color: AppColors.primary,
                ),
                children: [
                  // last text
                  TextSpan(
                    text: thirdText,
                    style: AppTextStyles.onboardingTitle.copyWith(
                      color: context.onboardingTitleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.onboardingSubtitle.copyWith(
            color: context.onboardingSubtitleColor,
          ),
        ),
      ],
    );
  }
}
