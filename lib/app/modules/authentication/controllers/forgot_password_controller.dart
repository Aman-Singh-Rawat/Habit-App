import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance =>
      Get.find<ForgotPasswordController>();

  /// controller
  final TextEditingController email = TextEditingController();

  /// Reactive variables
  RxBool isFieldEmpty = false.obs;

  /// others
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// functions
  @override
  void onInit() {
    super.onInit();

    // Listen to text changes
    email.addListener(_validateEmail);
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }

  /// Validation logic
  void _validateEmail() {
    isFieldEmpty.value = email.text.trim().isEmpty;
  }


  void sendOtpCode() {

  }
}
