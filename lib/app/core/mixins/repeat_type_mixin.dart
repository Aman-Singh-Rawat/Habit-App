import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/utils/app_enums.dart';

mixin RepeatTypeMixin {
  /// Repeat Type[daily, weekly, monthly];
  final selectedRepeatType = RepeatEnum.Daily.obs;

  /// on these day [daily]
  final RxBool isOnTheseDayCheckboxSelected = true.obs;

  /// on these day [weekly]
  final RxInt repeatSelectedPerWeekValue = (-1).obs;

  /// monthly section
  final RxList<int> selectedMonthlyDays = <int>[].obs;

  /// selected default days for daily
  final RxList<int> repeatSelectedDaysList = <int>[1, 2, 3, 4, 5, 6, 7].obs;

  String get repeatType => selectedRepeatType.value.name;

  bool get isNoRepeatSelected =>
      repeatSelectedDaysList.isEmpty &&
      repeatSelectedPerWeekValue.value == -1 &&
      selectedMonthlyDays.isEmpty;

  /// ============================================ X functions X ============================================
  void handleRepeatTypeWidgetClick(RepeatEnum repeatType) {
    selectedRepeatType.value = repeatType;
  }

  void onRepeatDateSelected(int index) {
    if (selectedMonthlyDays.remove(index)) return;

    /// if any days select in monthly then ==>
    selectedMonthlyDays.add(index);

    /// -- if checkbox is selected in daily then off that
    isOnTheseDayCheckboxSelected.value = false;

    /// -- remove all days from daily
    clearDailySelection();

    /// -- remove days selection from weekly
    clearWeeklySelection();
  }

  /// on these day [ALL_DAY]
  void handleOnAllDayCheckboxClick(bool? value) {
    isOnTheseDayCheckboxSelected.value = value ?? false;

    if (isOnTheseDayCheckboxSelected.value) {
      repeatSelectedDaysList.value = List.generate(7, (index) => index + 1);
    } else {
      repeatSelectedDaysList.value = [];
    }
  }

  /// Stores selected week days using 1-based indexing:
  /// 1 = Monday, 2 = Tuesday, 3 = Wednesday,
  /// 4 = Thursday, 5 = Friday, 6 = Saturday, 7 = Sunday
  void onRepeatSelectedDayChoose(int index) {
    final day = index + 1;

    if (repeatSelectedDaysList.contains(day)) {
      repeatSelectedDaysList.remove(day);
    } else {
      repeatSelectedDaysList.add(day);
      clearWeeklySelection();
    }

    isOnTheseDayCheckboxSelected.value = repeatSelectedDaysList.length == 7;

    if (!isOnTheseDayCheckboxSelected.value) {
      clearWeeklySelection();
    }
  }

  /// Repeat Type [weekly]
  void onRepeatWeeklyDaysClick(int value) {
    if (repeatSelectedPerWeekValue.value == value) {
      clearWeeklySelection();

      return;
    }
    clearDailySelection();
    clearMonthlySelection();
    repeatSelectedPerWeekValue.value = value;

    /// this is for daily days if 7 days a week chosen
    if (repeatSelectedPerWeekValue.value == 7) {
      isOnTheseDayCheckboxSelected.value = true;
      repeatSelectedDaysList.value = List.generate(7, (index) => index + 1);
    } else {
      isOnTheseDayCheckboxSelected.value = false;
    }
  }

  ///  [list, value, list]
  dynamic get getRepeatDays {
    switch (selectedRepeatType.value) {
      case RepeatEnum.Monthly:
        return selectedMonthlyDays;
      case RepeatEnum.Weekly:
        return repeatSelectedPerWeekValue.value;
      default:
        return repeatSelectedDaysList.value;
    }
  }

  /// clearing the list
  void clearDailySelection() {
    repeatSelectedDaysList.clear();
  }

  void clearMonthlySelection() {
    selectedMonthlyDays.clear();
  }

  void clearWeeklySelection() {
    repeatSelectedPerWeekValue.value = -1;
  }
}
