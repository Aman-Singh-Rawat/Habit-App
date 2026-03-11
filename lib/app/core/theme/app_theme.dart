import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/theme/app_text_theme.dart';
import 'package:habitly/app/core/theme/checkbox_theme.dart';
import 'package:habitly/app/core/theme/elevated_button_theme.dart';
import 'package:habitly/app/core/theme/text_field_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: AppTextTheme.lightTextTheme,
    fontFamily: 'Poppins',
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    checkboxTheme: ACheckboxTheme.theme,

    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      actionsPadding: EdgeInsets.only(right: 17),
      elevation: 0,
    ),

    inputDecorationTheme: TextFieldTheme.lightTheme,
    dividerTheme: DividerThemeData(color: AppColors.dividerColor),
    textButtonTheme: ATextButtonTheme.lightTheme,
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: AppTextTheme.darkTextTheme,
    fontFamily: 'Poppins',

    checkboxTheme: ACheckboxTheme.theme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: AppColors.darkScaffoldBacgroundColor,

    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
      backgroundColor: AppColors.darkScaffoldBacgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,

      actionsPadding: EdgeInsets.only(right: 17),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),

    inputDecorationTheme: TextFieldTheme.darkTheme,
    dividerTheme: DividerThemeData(color: AppColors.darkSecondaryColor),
    textButtonTheme: ATextButtonTheme.lightTheme,
  );
}
