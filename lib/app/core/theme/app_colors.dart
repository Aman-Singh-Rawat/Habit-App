import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';

import 'color_palette.dart';

class AppColors {
  AppColors._();

  /// Chetwode Blue Palette
  static const ColorPalette chetwode = ColorPalette(
    s50: Color(0xFFF0F1FD),
    s100: Color(0xFFE3E6FC),
    s200: Color(0xFFCDD0F8),
    s300: Color(0xFFAFB1F2),
    s400: Color(0xFF8985E9),
    s500: Color(0xFF8073E1),
    s600: Color(0xFF6F58D3),
    s700: Color(0xFF6048BA),
    s800: Color(0xFF4E3D96),
    s900: Color(0xFF433778),
    s950: Color(0xFF282046),
  );

  /// Example: Add more palettes easily
  static const ColorPalette success = ColorPalette(
    s50: Color(0xFFE8F5E9),
    s100: Color(0xFFC8E6C9),
    s200: Color(0xFFA5D6A7),
    s300: Color(0xFF81C784),
    s400: Color(0xFF66BB6A),
    s500: Color(0xFF4CAF50),
    s600: Color(0xFF43A047),
    s700: Color(0xFF388E3C),
    s800: Color(0xFF2E7D32),
    s900: Color(0xFF1B5E20),
    s950: Color(0xFF0D3B12),
  );

  /// other [Colors]
  ///
  static const Color dangerColor = Color(0xFFCE0000);
  static const Color successColor = Color(0xFF00A86B);
  static const Color warningColor = Color(0xFFE8A300);
  static const Color infoColor = Color(0xFF3B82F6); // Soft blue


  static const Color textFieldBackground = Color(0xFFFAFAFA);
  static const Color dividerColor = Color(0xFFf1f1f0);
  static const Color borderColor = Color(0xFFf3f3f2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color indicatorGrey = Color(0xFFededee);
  static const Color textGrey = Color(0xFF616161);
  static const Color textDark = Color(0xFF212021);
  static const Color unprogressColor = Color(0xFFEEEEEE);
  static const Color scaffoldBackgroundColor = Color(0xFFF5F5F5);

  /// primaries
  static const Color primary = Color(0xFF8985e9);
  static const Color primaryLight = Color(0xFFf6f5fd);
  static const Color primaryDark = Color(0xFF6e6aba);

  /// [DARK] Theme
  static const Color darkScaffoldBacgroundColor = Color(0xFF181a20);
  static const Color darkSecondaryColor = Color(0xFF353840);
  static const Color darkSecondaryTextColor = Color(0xFFefefef);
  static const Color lightWhite = Color(0xFFa9aaad);
  static const Color containerBackgroundColor = Color(0xFF1f222a);
  static const Color textFieldHintColor = Color(0xFF9e9e9f);
  static const Color aboutUserDarkBorder = Color(0xFF35383F);
  static const Color darkText = Color(0xFF9E9E9E);
  static const Color moodDarkEmptyIconColor = Color(0xFF757575);


  // container color
  static final containerColor = AHelperFunction.isDarkMode(Get.context!)
      ? AppColors.containerBackgroundColor
      : AppColors.white;

  // shadow color
  static final shadowColor = AHelperFunction.isDarkMode(Get.context!)
      ? Colors.black.withAlpha(5)
      : Colors.grey.shade200;
}
