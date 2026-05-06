import 'package:get/get.dart';
import 'package:habitly/app/modules/account/controllers/app_language_controller.dart';

class AppLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLanguageController>(() => AppLanguageController());
  }
}
