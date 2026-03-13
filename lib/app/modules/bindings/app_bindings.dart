import 'package:get/get.dart';
import 'package:habitly/app/data/local/local_storage.dart';
import 'package:habitly/app/data/local/mood_storage.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorage>(() => LocalStorage(), fenix: true);
    Get.lazyPut<MoodStorage>(() => MoodStorage(), fenix: true);
  }
}
