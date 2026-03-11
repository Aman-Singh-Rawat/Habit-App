import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';

class ProcrastinationController extends GetxController {
  ProcrastinationController get instance =>
      Get.find<ProcrastinationController>();
  RxInt selectedIndex = 0.obs;

  final List<Map<String, String>> options = [
    {'label': AppStrings.always, 'emoji': '😰'},
    {'label': AppStrings.sometimes, 'emoji': '😓'},
    {'label': AppStrings.rarely, 'emoji': '😅'},
    {'label': AppStrings.never, 'emoji': '😎'},
  ];

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
