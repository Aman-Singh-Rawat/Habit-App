// 1. Reusable controller (separate file)
import 'package:flutter/animation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MonthYearPickerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final selectedYear = 0.obs;
  final selectedMonth = 0.obs;

  late AnimationController animController;
  late Animation<double> scaleAnim;
  late Animation<double> fadeAnim;

  final now = DateTime.now();

  // Callback to notify parent on confirm
  final Function(DateTime) onConfirm;

  MonthYearPickerController({required this.onConfirm});

  @override
  void onInit() {
    super.onInit();
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    scaleAnim = CurvedAnimation(parent: animController, curve: Curves.easeOutBack);
    fadeAnim = CurvedAnimation(parent: animController, curve: Curves.easeOut);
    animController.forward();
  }

  @override
  void onClose() {
    animController.dispose();
    super.onClose();
  }

  void decrementYear() => selectedYear.value--;

  void incrementYear() {
    if (selectedYear.value < now.year) {
      selectedYear.value++;
      // Reset to current month if selected month is now in the future
      if (isFutureMonth(selectedMonth.value)) {
        selectedMonth.value = now.month;
      }
    }
  }

  void selectMonth(int month) {
    final isFuture = selectedYear.value == now.year && month > now.month;
    if (!isFuture) selectedMonth.value = month;
  }

  void confirm() {
    onConfirm(DateTime(selectedYear.value, selectedMonth.value));
    Get.back();
  }

  bool isFutureMonth(int month) =>
      selectedYear.value == now.year && month > now.month;

  bool isToday(int month) =>
      month == now.month && selectedYear.value == now.year;
}