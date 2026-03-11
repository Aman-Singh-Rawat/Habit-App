import 'package:get/get.dart';
import 'package:habitly/app/modules/user_setup/controllers/sleep_duration_controller.dart';

class SleepDurationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepDurationController>(() => SleepDurationController());
  }
}
