import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';

class CreateNewHabitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewHabitController>(() => CreateNewHabitController());
  }
}
