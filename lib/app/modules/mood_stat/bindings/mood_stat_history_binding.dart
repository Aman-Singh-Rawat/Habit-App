import 'package:get/get.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';

class MoodStatHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoodStatController());
  }
}
