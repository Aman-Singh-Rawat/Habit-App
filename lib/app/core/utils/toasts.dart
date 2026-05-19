import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import '../values/app_values.dart';

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

enum ToastType { success, error, warning, info }

class AppToast {
  static void success(BuildContext context, String message) {
    show(context, message: message, type: ToastType.success);
  }

  static void error(BuildContext context, String message) {
    show(context, message: message, type: ToastType.error);
  }

  static void warning(BuildContext context, String message) {
    show(context, message: message, type: ToastType.warning);
  }

  static void info(BuildContext context, String message) {
    show(context, message: message, type: ToastType.info);
  }

  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
  }) {
    Flushbar(
      messageText: Text(
        message,
        style: TextStyle(
          color: Colors.black,
          fontSize: font_13,
          fontWeight: .w500,
        ),
      ),
      icon: Icon(_icon(type), color: _color(type)),
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      boxShadows: [BoxShadow(color: Colors.black12, blurRadius: 10)],
    ).show(context);
  }

  static Color _color(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
        return Colors.blue;
    }
  }

  static IconData _icon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
        return Icons.info;
    }
  }
}
