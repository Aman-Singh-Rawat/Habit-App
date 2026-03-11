import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../month_year_picker_dialog.dart';
import '../show_mood_emoji_stat.dart';

final moods = [
  MoodCalendar(emoji: '😊', label: 'Good', date: DateTime(2026, 2, 25)),
  MoodCalendar(emoji: '😎', label: 'Great', date: DateTime(2026, 2, 26)),
  MoodCalendar(emoji: '😐', label: 'Okay', date: DateTime(2026, 2, 27)),
  MoodCalendar(emoji: '😡', label: 'Bad', date: DateTime(2026, 2, 28)),
  MoodCalendar(emoji: '😎', label: 'Great', date: DateTime(2026, 3, 1)),
  MoodCalendar(emoji: '😊', label: 'Good', date: DateTime(2026, 3, 2)),

  // skipped 3 March
  MoodCalendar(emoji: '😢', label: 'Low', date: DateTime(2026, 3, 4)),
];

class MoodStatController extends GetxController {
  // Class Instance
  static MoodStatController get instance => Get.find<MoodStatController>();

  // Global Variables
  Rx<DateTime> selectedMonth = DateTime.now().obs;
  final Map<DateTime, MoodCalendar> moodMap = {};

  final RxInt daysInMonth = 0.obs;
  final RxInt firstWeekday = 0.obs;
  final RxInt selectedMoodIndex = (-1).obs;
  final RxInt selectedFeelingIndex = (-1).obs;

  // Getx Methods
  @override
  void onInit() {
    super.onInit();

    /// getting total number of days in selected mont
    /// and getting weekday on 1st date
    calculateMonthData();

    /// listening the changes because whenever the selected date changes we needed last date & number of months
    ever(selectedMonth, (_) => calculateMonthData());

    /// buildMoodMap is for stored date in which date user added their mood
    /// the purpose of buildMoodMap is to binding mood with date key
    buildMoodMap();
  }

  // User Methods
  void buildMoodMap() {
    moodMap.clear();

    for (final mood in moods) {
      moodMap[normalizeDate(mood.date)] = mood;
    }
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

  void handleMoodSelection() {
    if (selectedMoodIndex.value != -1) {
      Toasts.successToast(msg: 'Yeh bro what is it');
      showMoodFeelingStat(instance);
    }
  }
}
