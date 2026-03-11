import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  /* ---------------- Light ---------------- */

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge.copyWith(
      color: AppColors.textDark,
    ),
    displayMedium: AppTextStyles.displayMedium.copyWith(
      color: AppColors.textDark,
    ),
    displaySmall: AppTextStyles.displaySmall.copyWith(
      color: AppColors.textDark,
    ),

    headlineLarge: AppTextStyles.headingXL.copyWith(color: AppColors.textDark),
    headlineMedium: AppTextStyles.headingLG.copyWith(color: AppColors.textDark),
    headlineSmall: AppTextStyles.headingMD.copyWith(color: AppColors.textDark),

    bodyLarge: AppTextStyles.bodyLG.copyWith(color: AppColors.textDark),
    bodyMedium: AppTextStyles.bodyMD.copyWith(color: AppColors.textGrey),
    bodySmall: AppTextStyles.bodySM.copyWith(color: AppColors.textGrey),

    labelLarge: AppTextStyles.labelLG.copyWith(color: AppColors.textDark),
    labelMedium: AppTextStyles.labelMD.copyWith(color: AppColors.textGrey),
    labelSmall: AppTextStyles.labelSM.copyWith(color: AppColors.textGrey),
  );

  /* ---------------- Dark ---------------- */

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.white),
    displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.white),
    displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.white),

    headlineLarge: AppTextStyles.headingXL.copyWith(color: AppColors.white),
    headlineMedium: AppTextStyles.headingLG.copyWith(color: AppColors.white),
    headlineSmall: AppTextStyles.headingMD.copyWith(color: AppColors.white),

    bodyLarge: AppTextStyles.bodyLG.copyWith(color: AppColors.white),
    bodyMedium: AppTextStyles.bodyMD.copyWith(
      color: AppColors.darkSecondaryTextColor,
    ),
    bodySmall: AppTextStyles.bodySM.copyWith(
      color: AppColors.darkSecondaryTextColor,
    ),

    labelLarge: AppTextStyles.labelLG.copyWith(color: AppColors.white),
    labelMedium: AppTextStyles.labelMD.copyWith(
      color: AppColors.darkSecondaryTextColor,
    ),
    labelSmall: AppTextStyles.labelSM.copyWith(
      color: AppColors.darkSecondaryTextColor,
    ),
  );
}
