import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

void showLoadingDialog({required String text}) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Theme.of(Get.overlayContext!).scaffoldBackgroundColor,
      elevation: 10,
      contentPadding: const EdgeInsets.symmetric(vertical: 34),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitFadingCircle(color: AppColors.primary, size: 55),

          const SizedBox(height: 25),

          Text(
            "$text...",
            style: Theme.of(
              Get.overlayContext!,
            ).textTheme.headlineMedium!.copyWith(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
