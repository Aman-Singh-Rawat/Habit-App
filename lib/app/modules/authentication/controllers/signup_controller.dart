import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/dialogs/loading_dialog.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  /// Controllers
  final email = TextEditingController();
  final password = TextEditingController();

  /// Reactive variables
  final RxBool isPasswordVisible = false.obs;
  final RxBool isTermsAndConditionCheck = false.obs;
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
    isTermsAndConditionCheck.value = value;
  }

  bool get canSubmit =>
      !isEmailAndPasswordEmpty.value && isTermsAndConditionCheck.value;

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
  void signup() {
    showLoadingDialog(text: AppStrings.signUp);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
