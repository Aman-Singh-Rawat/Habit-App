import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/theme/theme_service.dart';

class ThemeController extends GetxController {
  /// instance
  static ThemeController get instance => Get.find<ThemeController>();

  final ThemeService _service;

  ThemeController(this._service);

  final currentThemeMode = ThemeMode.system.obs;
  final RxInt selectedThemeIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    loadTheme();
  }

  void loadTheme() {
    currentThemeMode.value = _service.getThemeMode();
    Get.changeThemeMode(currentThemeMode.value);

    changeSelectedThemeIndex(currentThemeMode.value);
  }

  Future<void> selectTheme(int index) async {

    Get.back();

    await Future.delayed(
      const Duration(milliseconds: 200),
    );

    changeTheme(index);
  }

  Future<void> changeTheme(int index) async {
    selectedThemeIndex.value = index;

    final ThemeMode mode = switch (index) {
      2 => ThemeMode.dark,
      1 => ThemeMode.light,
      _ => ThemeMode.system,
    };

    currentThemeMode.value = mode;

    Get.changeThemeMode(mode);

    await _service.saveThemeMode(mode);
  }

  void changeSelectedThemeIndex(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        selectedThemeIndex.value = 0;
      case ThemeMode.light:
        selectedThemeIndex.value = 1;
      case ThemeMode.dark:
        selectedThemeIndex.value = 2;
    }
  }
}
