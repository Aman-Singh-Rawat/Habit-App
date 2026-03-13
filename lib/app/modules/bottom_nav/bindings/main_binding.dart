import 'package:get/get.dart';
import 'package:habitly/app/modules/bottom_nav/controllers/main_controller.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';
import 'package:habitly/app/modules/my_habits/controllers/my_habits_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);

    // bottom
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<MoodStatController>(() => MoodStatController(),);
    Get.lazyPut<MyHabitsController>(() => MyHabitsController(),);
  }
}
