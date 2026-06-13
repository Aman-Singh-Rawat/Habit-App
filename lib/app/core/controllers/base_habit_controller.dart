import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseHabitController extends GetxController {
  final habitController = TextEditingController();

  bool validateHabit(BuildContext context);

  Future<void> saveHabit(BuildContext context);
}