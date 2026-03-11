import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

extension OnboardingTextColorX on BuildContext {
  Color get onboardingTitleColor =>
      isDark ? AppColors.white : AppColors.textDark;

  Color get onboardingSubtitleColor =>
      isDark ? AppColors.darkSecondaryTextColor : AppColors.textGrey;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
