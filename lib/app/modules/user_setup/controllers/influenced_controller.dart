import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_strings.dart';

class InfluencedController extends GetxController {
  InfluencedController get instance => Get.find<InfluencedController>();
  RxList<int> selectedValuesIndex = <int>[].obs;

  final List<Map<String, String>> options = [
    {'label': AppStrings.lackOfMotivation, 'emoji': '🎯'},
    {'label': AppStrings.workOverload, 'emoji': '🔗'},
    {'label': AppStrings.clutteredEnvironment, 'emoji': '🎭'},
    {'label': AppStrings.digitalDistractions, 'emoji': '🎮'},
    {'label': AppStrings.lackOfTimeManagement, 'emoji': '🧨'},
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
