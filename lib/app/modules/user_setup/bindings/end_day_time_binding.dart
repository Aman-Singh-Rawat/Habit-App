import 'package:get/instance_manager.dart';
import 'package:habitly/app/modules/user_setup/controllers/end_day_time_controller.dart';

class EndDayTimeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndDayTimeController>(() => EndDayTimeController());
  }
}
