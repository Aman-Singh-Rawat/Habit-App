import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_feeling_model.dart';
import 'package:hive/hive.dart';

class MoodStorage extends GetxController {
  /// Class Instance
  static MoodStorage get instance => Get.find<MoodStorage>();

  /// database
  final Box<MoodFeelingModel> _moodFeelingBox = Hive.box<MoodFeelingModel>(
    strMoodFeeling,
  );

  /// add item
  Future<void> addMoodFeeling(MoodFeelingModel mood) async {
    _moodFeelingBox.add(mood);
  }

  /// delete item
  Future<void> deleteMoodFeeling(MoodFeelingModel mood) async {
    await _moodFeelingBox.delete(mood);
  }

  /// fetch all list
  List<MoodFeelingModel> getAllMoodFeeling() {
    return _moodFeelingBox.values.toList();
  }
}
