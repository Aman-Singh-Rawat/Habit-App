import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class ATextButtonTheme {
  const ATextButtonTheme._();

  static final lightTheme = TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(double.infinity, 55),
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.primaryLight,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.primaryDark,
      textStyle: TextStyle(color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    ),
  );
}
