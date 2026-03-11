import 'package:get/get.dart';
import 'package:habitly/app/data/local/local_storage.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LocalStorage(), permanent: true);
  }
}
