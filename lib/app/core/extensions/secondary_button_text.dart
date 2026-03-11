import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

extension HabitButtonThemeX on BuildContext {
  Color get secondaryButtonTextColor =>
      isDark ? AppColors.white : AppColors.primary;

  Color get secondaryBackgroundColor =>
      isDark ? AppColors.darkSecondaryColor : AppColors.primaryLight;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
