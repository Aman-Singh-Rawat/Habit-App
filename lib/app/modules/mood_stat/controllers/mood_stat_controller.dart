import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:habitly/app/data/local/mood_storage.dart';
import 'package:habitly/app/modules/mood_stat/models/mood.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_calendar.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_feeling_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_lists.dart';
import '../month_year_picker_dialog.dart';
import '../show_mood_emoji_stat.dart';

class MoodStatController extends GetxController {
  // Class Instance
  static MoodStatController get instance => Get.find<MoodStatController>();

  // Global Variables
  Rx<DateTime> selectedMonth = DateTime.now().obs;
  final RxMap<DateTime, MoodFeelingModel> moodMap =
      <DateTime, MoodFeelingModel>{}.obs;

  /// containing the list of moods which user added
  final RxList<MoodFeelingModel> moods = <MoodFeelingModel>[].obs;

  /// others
  final RxInt daysInMonth = 0.obs;
  final RxInt firstWeekday = 0.obs;
  final RxInt selectedMoodIndex = (-1).obs;
  final RxInt selectedFeelingIndex = (-1).obs;

  // Database instance
  final MoodStorage storage = MoodStorage.instance;

  // Getx Methods
  @override
  void onInit() {
    super.onInit();

    /// getting total number of days in selected mont
    /// and getting weekday on 1st date
    calculateMonthData();

    /// listening the changes because whenever the selected date changes we needed last date & number of months
    ever(selectedMonth, (_) => calculateMonthData());

    loadMoods();
  }

  void loadMoods() {
    final list = storage.getAllMoodFeeling();
    print('MoodList;; =>> ${list.map((item) => item.toString())}');
    moods.assignAll(List.from(list)); // force new reference
    print("called mood_stat_controller");
    buildMoodMap();
  }

  void buildMoodMap() {
    moodMap.clear();
    moodMap.addAll({
      for (final mood in moods)
        normalizeDate(mood.date): mood
    });
  }

  void calculateMonthData() {
    /// TOTAL number of days in selected month
    daysInMonth.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + 1,
      0,
    ).day;

    /// SELECTING WHAT DAY WILL BE ON FIRST DATE IN [MON, TUE, WED] RETURN => NUMBER [1, 2, 3]
    firstWeekday.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month,
      1,
    ).weekday;
  }

  // previous toggle month
  void previousMonth() {
    selectedMonth.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month - 1,
    );
  }

  // next toggle month
  void nextMonth() {
    selectedMonth.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + 1,
    );
  }

  void showMonthYearPicker() {
    MonthYearPickerDialog.show(
      initialDate: selectedMonth.value,
      onConfirm: (date) => selectedMonth.value = date,
    );
  }

  void handleMoodSelection(MoodFeelingModel? moodFeelingModel, DateTime selectedDate,) async {
    if (selectedMoodIndex.value != -1) {
      String id =
          '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(999)}';

      print("debugs list==>:: ${AppLists.moodList[selectedMoodIndex.value]}");
      final mood = AppLists.moodList[selectedMoodIndex.value];
      if (moodFeelingModel != null) {
        moodFeelingModel.title = mood.title;
        moodFeelingModel.emoji = mood.emoji;

        moodFeelingModel.save();
      } else {
        await storage.addMoodFeeling(
          MoodFeelingModel(
            id: id,
            title: mood.title,
            emoji: mood.emoji,
            date: normalizeDate(selectedDate),
          ),
        );
      }

      print("debugs ====>:: ${storage.getAllMoodFeeling()}");
      loadMoods();
      selectedMoodIndex.value = -1;
      Get.back();

      final updatedMood = moodMap[normalizeDate(selectedDate)];
      showMoodFeelingStat(instance, updatedMood, selectedDate);
    }
  }

  void handleFeelingSelection(DateTime selectedDate) async {
    if (selectedFeelingIndex.value != -1) {
      final feeling = AppLists.feelingsList[selectedFeelingIndex.value];

      final allMoods = storage.getAllMoodFeeling();

      final todayMood = allMoods.firstWhere(
        // ✅ use selectedDate instead of DateTime.now()
            (e) => isSameDay(e.date, normalizeDate(selectedDate)),
        orElse: () => throw Exception("No mood found for selected date"),
      );

      todayMood.feeling = feeling;
      todayMood.updatedAt = DateTime.now();

      await todayMood.save();
      loadMoods();

      print("debugs ====>:: ${storage.getAllMoodFeeling()}");
      selectedFeelingIndex.value = -1;
      Get.back();
    }
  }
}
