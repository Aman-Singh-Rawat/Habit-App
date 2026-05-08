import 'package:get/get.dart';
import 'package:habitly/app/modules/account/controllers/personal_controller.dart';

class PersonalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
