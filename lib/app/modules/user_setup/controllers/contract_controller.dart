import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:signature/signature.dart';

class ContractController extends GetxController {
  ContractController get instance => Get.find();

  late SignatureController signatureController;

  @override
  void onInit() {
    super.onInit();
    _initializeSignatureController();
  }

  void _initializeSignatureController() {
    signatureController = SignatureController(
      penStrokeWidth: 5,
      penColor: AHelperFunction.isDarkMode(Get.context!)
          ? Colors.white
          : AppColors.darkScaffoldBacgroundColor,
      exportBackgroundColor: AHelperFunction.isDarkMode(Get.context!)
          ? AppColors.containerBackgroundColor
          : AppColors.white,
    );
  }

  void reinitializeOnThemeChange() {
    // Save current signature if needed
    final points = signatureController.points;

    // Dispose old controller
    signatureController.dispose();

    // Create new controller with updated theme
    _initializeSignatureController();

    // Restore signature if needed
    if (points.isNotEmpty) {
      signatureController.points = points;
    }

    update(); // Notify GetX to rebuild
  }

  void clearController() => signatureController.clear();

  @override
  void onClose() {
    signatureController.dispose();
    super.onClose();
  }
}
