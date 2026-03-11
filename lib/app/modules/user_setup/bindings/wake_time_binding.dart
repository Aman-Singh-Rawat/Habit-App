import 'package:get/instance_manager.dart';
import 'package:habitly/app/modules/user_setup/controllers/wake_time_controller.dart';

class WakeTimeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WakeTimeController>(() => WakeTimeController());
  }
}
