import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:toastification/toastification.dart';

class Toasts {
  static Color get getBackgroundColor {
    return AHelperFunction.isDarkMode(Get.context!)
        ? AppColors.darkSecondaryColor
        : AppColors.white;
  }

  static ToastificationItem successToast({required String msg}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.success,

        title: Text(
          msg,
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: AppColors.successColor,
        showProgressBar: false,
      );

  static ToastificationItem errorToast({required String err}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.error,
        title: Text(
          err,
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: AppColors.dangerColor,
        showProgressBar: false,
      );

  static ToastificationItem warningToast({required String waring}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.warning,
        title: Text(
          waring,
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: AppColors.warningColor,
        showProgressBar: false,
      );

  static ToastificationItem infoToast({required String msg}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.info,

        title: Text(
          msg,
          maxLines: 5,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500, // Slightly softer than success
          ),
        ),

        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: AppColors.infoColor,
        // Use a calm blue/neutral tone
        showProgressBar: false,
        closeButtonShowType: CloseButtonShowType.none,
      );
}
