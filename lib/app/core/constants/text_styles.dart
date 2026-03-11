import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Poppins';

  /* ---------------- Display ---------------- */

  static final displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 46.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static final displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 38.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static final displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  /* ---------------- Headings ---------------- */

  static final headingXL = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
  );

  static final headingLG = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );

  static final headingMD = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static final headingSM = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  /* ---------------- Body ---------------- */

  static final bodyLG = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final bodyMD = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  static final bodySM = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
  );

  /* ---------------- Labels ---------------- */

  static final labelLG = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static final labelMD = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
  );

  static final labelSM = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 9.sp,
    fontWeight: FontWeight.w500,
  );

  /* ---------------- Buttons ---------------- */

  static final button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  /* ---------------- Caption / Helper ---------------- */

  static final caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );

  static final overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  static final buttonStyle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final onboardingTitle = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    height: 1.7,
    color: AppColors.textDark,
  );

  static final onboardingSubtitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.65,
    color: AppColors.textGrey,
  );

  static final textFieldTitleStyle = TextStyle(
    color: AppColors.textDark,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );

  static final textFieldTextStyle = TextStyle(
    color: AppColors.textDark,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final goalTitle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 15.sp,
  );

  static final repeatChildStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 11.sp,
  );
}
