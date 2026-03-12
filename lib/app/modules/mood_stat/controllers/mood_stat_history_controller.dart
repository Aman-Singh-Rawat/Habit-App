import 'package:get/get.dart';
import 'package:habitly/app/data/local/mood_storage.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_feeling_model.dart';

class MoodStatHistoryController extends GetxController {
  // class instance
  static MoodStatHistoryController get instance =>
      Get.find<MoodStatHistoryController>();

  // local
  final MoodStorage storage = MoodStorage.instance;

  // mood list
  final RxList<MoodFeelingModel> moods = <MoodFeelingModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    moods.value = storage.getAllMoodFeeling();
  }
}
