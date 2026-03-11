import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitly/app/modules/user_setup/controllers/procrastination_controller.dart';

class ProcrastinationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcrastinationController>(() => ProcrastinationController());
  }
}
