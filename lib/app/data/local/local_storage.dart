import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/modules/home/models/base_habit.dart';
import 'package:habitly/app/modules/home/models/one_time_task.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage extends GetxController {
  /// GETX INSTANCE FOR HABIT Repository
  static LocalStorage get instance => Get.find<LocalStorage>();

  final Box<RegularHabit> _regularBox = Hive.box<RegularHabit>(strRegularHabits);
  final Box<OneTimeTask> _taskBox = Hive.box<OneTimeTask>(strOneTimeTasks);

  List<BaseHabit> getAllHabits() {
    return [];
  }

  RegularHabit? getLastHabit() {
    if (_regularBox.isEmpty) return null;
    return _regularBox.getAt(_regularBox.length - 1);
  }

  List<RegularHabit> getAllRegularHabits() {
    return _regularBox.values.toList();
  }

  List<OneTimeTask> getAllOneTimeTasksList() {
    return _taskBox.values.toList();
  }

  Future<void> addRegularHabit(RegularHabit habit) async {
    Get.printInfo(info: '\naddRegularHabit:: ${habit.toString()}\n');
    await _regularBox.add(habit);
  }

  Future<void> addOneTimeTask(OneTimeTask task) async {
    await _taskBox.add(task);
  }

  Future<void> deleteRegular(int index) async {
    await _regularBox.deleteAt(index);
  }

  Future<void> deleteTask(int index) async {
    await _taskBox.deleteAt(index);
  }
}
