import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';

class SleepDurationController extends GetxController {
  SleepDurationController get instance => Get.find<SleepDurationController>();
  RxInt selectedIndex = 0.obs;

  final List<Map<String, String>> options = [
    {'label': AppStrings.lessThan6Hours, 'emoji': '😪'},
    {'label': AppStrings.sixToSevenHours, 'emoji': '😌'},
    {'label': AppStrings.sevenToEightHours, 'emoji': '😊'},
    {'label': AppStrings.eightToNineHours, 'emoji': '😏'},
    {'label': AppStrings.moreThan9Hours, 'emoji': '😅'},
  ];

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
