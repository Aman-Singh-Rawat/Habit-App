import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitly/app/modules/user_setup/controllers/achieve_controller.dart';

class AchieveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AchieveController>(() => AchieveController());
  }
}
