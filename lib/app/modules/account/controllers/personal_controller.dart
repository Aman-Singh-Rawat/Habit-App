import 'package:get/get.dart';

class PersonalController extends GetxController {
  /// controller instance
  static PersonalController get controller => Get.find<PersonalController>();

  /// variables
  RxString selectGender = ''.obs;
}
