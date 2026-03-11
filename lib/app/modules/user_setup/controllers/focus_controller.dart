import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';

class FocusController extends GetxController {
  FocusController get instance => Get.find<FocusController>();
  RxInt selectedIndex = 0.obs;

  final List<Map<String, String>> options = [
    {'label': AppStrings.constantly, 'emoji': '😰'},
    {'label': AppStrings.occasionally, 'emoji': '😞'},
    {'label': AppStrings.rarely, 'emoji': '😅'},
    {'label': AppStrings.never, 'emoji': '😄'},
  ];

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
