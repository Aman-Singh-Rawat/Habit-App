import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class CustomSwitchTheme {
  const CustomSwitchTheme._();

  static SwitchThemeData get lightTheme {
    return SwitchThemeData(

      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
      }),
    );
  }
}
