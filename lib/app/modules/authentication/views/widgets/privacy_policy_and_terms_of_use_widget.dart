import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';

class PrivacyPolicyAndTermsOfUseWidget extends StatelessWidget {
  const PrivacyPolicyAndTermsOfUseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AHelperFunction.isDarkMode(context)
        ? AppColors.lightWhite
        : AppColors.textGrey;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // privacy policy
        Text(
          AppStrings.privacyPolicy,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),

        // center point
        Container(
          width: 2.0,
          height: 2.0,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),

        // Terms of Service
        Text(
          AppStrings.termsOfService,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}
