import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class ACheckboxTheme {
  const ACheckboxTheme._();

  static final theme = CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    checkColor: WidgetStatePropertyAll(AppColors.white),

    fillColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? AppColors.primary
          : Colors.transparent;
    }),
    side: BorderSide(color: AppColors.primary, width: 2.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
