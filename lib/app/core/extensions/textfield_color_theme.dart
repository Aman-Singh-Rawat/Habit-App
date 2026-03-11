import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

extension TextFieldThemeContextX on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get textFieldLabelColor =>
      isDark ? AppColors.white : AppColors.textDark;

  Color get textFieldTextColor => isDark ? AppColors.white : AppColors.textDark;

  Color get textFieldHintColor =>
      isDark ? AppColors.textFieldHintColor : AppColors.lightWhite;

  Color get textFieldIconColor => isDark
      ? AppColors.darkSecondaryTextColor
      : AppColors.darkScaffoldBacgroundColor;
}
