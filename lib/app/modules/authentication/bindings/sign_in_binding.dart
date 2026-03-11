import 'package:get/get.dart';
import 'package:habitly/app/modules/authentication/controllers/sign_in_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
