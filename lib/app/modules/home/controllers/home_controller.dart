import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/dialogs/show_warning_dialog.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:habitly/app/data/local/local_storage.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HomeController get instance => Get.find<HomeController>();
  final LocalStorage storage = LocalStorage.instance;
  final RxList<RegularHabit> regularHabits = <RegularHabit>[].obs;
  final RxList<RegularHabit> todayHabits = <RegularHabit>[].obs;
  final RxList<RegularHabit> todayCompletedHabits = <RegularHabit>[].obs;
  final RxList<RegularHabit> weeklyHabits = <RegularHabit>[].obs;

  late TabController controller;
  RxInt selectedTabIndex = 0.obs;
  RxInt dayTimeIndex = 0.obs;

  @override
  void onInit() {
    controller = TabController(length: 3, vsync: this);

    controller.addListener(() {
      selectedTabIndex.value = controller.index;
    });

    loadHabits();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void loadHabits() {
    regularHabits.value = storage.getAllRegularHabits();
    todayHabits.value = filteredTodayHabits(false);
    todayCompletedHabits.value = filteredTodayHabits(true);
    weeklyHabits.value = getHabitByFilter(strWeekly);
    Get.printInfo(info: 'weeklyHabits loadHabits:: ${weeklyHabits.length}');
  }

  List<RegularHabit> getHabitByFilter(String filter) {
    return regularHabits.where((habit) => habit.repeatType == filter).toList();
  }

  // Today - Weekly - Overall related work
  bool isSelected(int index) {
    return selectedTabIndex.value == index;
  }

  void onTabClick(int index) {
    selectedTabIndex.value = index;
    controller.animateTo(index);
    update();
  }

  // Category related work

  bool isDaytimeSelected(int index) => index == dayTimeIndex.value;

  void onDayTimeChanged(int index) {
    dayTimeIndex.value = index;
    todayHabits.value = filteredTodayHabits(false);
    todayCompletedHabits.value = filteredTodayHabits(true);
  }

  List<RegularHabit> getTodayHabit() {
    return regularHabits
        .where((habit) => habit.repeatType == strDaily)
        .toList();
  }

  void updateWeeklyHabitDays(int habitIndex, int day) {
    final habit = weeklyHabits[habitIndex];

    habit.weeklyDays ??= [];

    if (habit.weeklyDays!.contains(day)) {
      habit.weeklyDays!.remove(day);
    } else {
      habit.weeklyDays!.add(day);
    }

    habit.save();
    weeklyHabits.refresh();
  }

  List<RegularHabit> filteredTodayHabits(bool isCompleted) {
    final dailyHabits = getHabitByFilter(strDaily);
    final today = normalizeDate(DateTime.now());

    String? selectedTime;

    switch (dayTimeIndex.value) {
      case 1:
        selectedTime = strMorning;
        break;
      case 2:
        selectedTime = strAfternoon;
        break;
      case 3:
        selectedTime = strEvening;
        break;
      default:
        selectedTime = null;
    }

    return dailyHabits.where((h) {
      final isCompletedToday = AHelperFunction.containsToday(
        h.completedDates,
        today,
      );

      final matchesCompletion = isCompleted
          ? isCompletedToday
          : !isCompletedToday;

      if (selectedTime == null) {
        return matchesCompletion;
      }

      return h.doItAt == selectedTime && matchesCompletion;
    }).toList();
  }

  Future<bool> confirmDismiss(
    DismissDirection direction,
    RegularHabit habit,
  ) async {
    if (direction == DismissDirection.endToStart) {
      final shouldDelete = await showWarningDialog(
        context: Get.context!,
        title: strDeleteHabit,
        message: strAreYouSureYouWantToDeleteThisHabit,
        confirmText: strDelete,
      );

      if (shouldDelete == true) {
        deleteHabit(direction, habit);
        return true; // allow dismiss
      }

      return false; // cancel dismiss
    } else {
      completeHabitToggle(habit);
      return false;
    }

    return true; // allow complete swipe
  }

  void deleteHabit(DismissDirection direction, RegularHabit habit) async {
    if (direction == DismissDirection.endToStart) {
      regularHabits.removeWhere((h) => h.id == habit.id);
      update();

      await habit.delete();

      Toasts.successToast(msg: "Habit deleted successfully");
    }
  }

  /*Future<bool> deleteHabit(DismissDirection direction, RegularHabit habit) async {
    /// MEANS [COMPLETED]
    if (direction == DismissDirection.startToEnd) {
    } else if (direction == DismissDirection.endToStart) {
      /// MEANS [DELETED]

      final shouldDelete = await showWarningDialog(
        context: Get.context!,
        title: "Delete Habit?",
        message:
        "Are you sure you want to delete this habit? This action cannot be undone.",
        confirmText: "Delete",
      );

      if (shouldDelete == true) {
        await habit.delete();
        regularHabits.refresh();
        Toasts.successToast(msg: "Habit completed! 🔥 ${calculateStreak(habit)}-day streak!");
      }
      
    }
  }*/

  int calculateDailyStreak(RegularHabit habit) {
    int streak = 0;

    DateTime today = normalizeDate(DateTime.now());

    // If not completed today, start from yesterday
    if (!habit.completedDates.contains(today)) {
      today = today.subtract(const Duration(days: 1));
    }

    while (habit.completedDates.contains(today)) {
      streak++;
      today = today.subtract(const Duration(days: 1));
    }

    return streak;
  }

  int calculateWeeklyStreak(RegularHabit habit) {
    int streak = 0;
    DateTime day = normalizeDate(DateTime.now());

    while (true) {
      if (habit.weeklyDays?.contains(day.weekday) ?? false) {
        if (habit.completedDates.contains(day)) {
          streak++;
        } else {
          break;
        }
      }

      day = day.subtract(const Duration(days: 1));
    }

    return streak;
  }

  void reloadTodayHabits() {
    final dailyHabits = getHabitByFilter(strDaily);
    final today = normalizeDate(DateTime.now());

    final completed = <RegularHabit>[];
    final pending = <RegularHabit>[];

    for (var h in dailyHabits) {
      final isCompletedToday = AHelperFunction.containsToday(h.completedDates, today);

      if (isCompletedToday) {
        completed.add(h);
      } else {
        pending.add(h);
      }
    }

    todayCompletedHabits.value = completed;
    todayHabits.value = pending;
  }

  void completeHabitToggle(RegularHabit habit) {
    final today = normalizeDate(DateTime.now());

    if (habit.completedDates.contains(today)) {
      habit.completedDates.remove(today);
      Toasts.infoToast(msg: strCompleteItWheneverYouReady);
    } else {
      habit.completedDates.add(today);
      final streak = calculateStreak(habit);

      if (streak == 1) {
        Toasts.successToast(msg: strGreatStartDayOneComplete);
      } else if (streak > 1) {
        Toasts.successToast(msg: "$strHabitCompleted ${streak}-$strDayStreak");
      } else {
        Toasts.successToast(msg: strHabitCompletedForToday);
      }
    }

    habit.save();
    reloadTodayHabits();
    //regularHabits.refresh();
  }

  int calculateStreak(RegularHabit habit) {
    if (habit.repeatType == strDaily) {
      return calculateDailyStreak(habit);
    } else {
      return calculateWeeklyStreak(habit);
    }
  }
}
