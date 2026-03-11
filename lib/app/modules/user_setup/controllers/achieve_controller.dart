import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';

class AchieveController extends GetxController {
  AchieveController get instance => Get.find<AchieveController>();
  RxList<int> selectedValuesIndex = <int>[].obs;

  final List<Map<String, String>> options = [
    {'label': AppStrings.buildHealthyHabits, 'emoji': '🔑'},
    {'label': AppStrings.boostProductivity, 'emoji': '🏅'},
    {'label': AppStrings.achievePersonalGoals, 'emoji': '🏆'},
    {'label': AppStrings.manageStressAnxiety, 'emoji': '😇'},
    {'label': AppStrings.otherSpecify, 'emoji': '✨'},
  ];

  // toggleSelectedItem
  void toggleIndex(int index) {
    if (selectedValuesIndex.contains(index)) {
      selectedValuesIndex.remove(index);
    } else {
      selectedValuesIndex.add(index);
    }
  }

  // is options selected check
  bool isSelected(int index) {
    return selectedValuesIndex.contains(index);
  }
}
