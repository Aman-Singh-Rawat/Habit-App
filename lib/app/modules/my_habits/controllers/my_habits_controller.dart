import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/data/local/local_storage.dart';
import 'package:habitly/app/modules/home/models/one_time_task.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';

class MyHabitsController extends GetxController
    with GetTickerProviderStateMixin {
  /// CLASS instance
  static MyHabitsController get instance => Get.find<MyHabitsController>();

  // variables
  late TabController tabController;
  final storage = Get.find<LocalStorage>();

  // Rx variables
  final RxInt selectedTabIndex = 0.obs;
  final RxList<RegularHabit> regularHabitList = <RegularHabit>[].obs;
  final RxList<OneTimeTask> oneTimeTaskList = <OneTimeTask>[].obs;

  /// Getx Functions
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          selectedTabIndex.value = tabController.index;
        }
      });

    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  /// User Functions
  void loadData() {
    regularHabitList.value = storage.getAllRegularHabits();
    oneTimeTaskList.value = storage.getAllOneTimeTasksList();
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;

    final item = regularHabitList.removeAt(oldIndex);
    regularHabitList.insert(newIndex, item);
    //regularHabitList.save();
  }
}
