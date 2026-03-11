import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class TextFieldTheme {
  const TextFieldTheme._();

  static final textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12),
  );

  static final lightTheme = InputDecorationTheme(
    border: textFieldBorder,
    enabledBorder: textFieldBorder,
    errorBorder: textFieldBorder,
    focusedBorder: textFieldBorder,
    filled: true,
    fillColor: AppColors.textFieldBackground,
  );

  static final darkTheme = InputDecorationTheme(
    border: textFieldBorder,
    enabledBorder: textFieldBorder,
    errorBorder: textFieldBorder,
    focusedBorder: textFieldBorder,
    filled: true,
    fillColor: AppColors.containerBackgroundColor,
  );
}
