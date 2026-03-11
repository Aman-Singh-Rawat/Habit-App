import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/dialogs/loading_dialog.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find<SignInController>();

  /// Controllers
  final email = TextEditingController();
  final password = TextEditingController();

  /// Reactive variables
  final RxBool isPasswordVisible = false.obs;
  final RxBool isRememberMe = false.obs;
  final RxBool isEmailAndPasswordEmpty = true.obs;

  /// others
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    // Listen to text changes
    email.addListener(_validateEmailAndPassword);
    password.addListener(_validateEmailAndPassword);
  }

  /// Checkbox toggle
  void changeCheckBoxSelection(bool? value) {
    if (value == null) return;
    isRememberMe.value = value;
  }

  /// Validation logic
  void _validateEmailAndPassword() {
    isEmailAndPasswordEmpty.value =
        email.text.trim().isEmpty || password.text.trim().isEmpty;
  }

  /// Password toggle
  void onObscureClick() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// signup button
  void signIn() async {
    showLoadingDialog(text: AppStrings.signIn);

    await Future.delayed(const Duration(seconds: 2));

    Get.back(); // close loading dialog
    Get.toNamed(AppRoutes.sleepDuration);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
