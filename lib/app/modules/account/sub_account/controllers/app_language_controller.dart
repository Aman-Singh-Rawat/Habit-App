import 'package:get/get.dart';

class AppLanguageController extends GetxController {
  RxInt selectedLanguageIndex = 0.obs;


  void handleLanguageSelection(int index) {
    selectedLanguageIndex.value = index;
  }
}
