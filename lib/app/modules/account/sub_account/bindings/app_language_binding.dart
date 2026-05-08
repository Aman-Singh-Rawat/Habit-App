import 'package:get/get.dart';

import '../controllers/app_language_controller.dart';

class AppLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLanguageController>(() => AppLanguageController());
  }
}
