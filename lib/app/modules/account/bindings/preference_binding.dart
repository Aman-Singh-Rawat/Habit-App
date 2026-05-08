import 'package:get/get.dart';
import 'package:habitly/app/modules/account/controllers/preference_controller.dart';

class PreferenceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceController>(() => PreferenceController());
  }
}
