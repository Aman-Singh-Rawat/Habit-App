import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/theme/theme_service.dart';

import '../dialogs/loading_dialog.dart';

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

  void changeTheme(int index) {
    selectedThemeIndex.value = index;

    final ThemeMode mode = switch (index) {
      2 => ThemeMode.dark,
      1 => ThemeMode.light,
      _ => ThemeMode.system,
    };

    currentThemeMode.value = mode;

    Get.changeThemeMode(mode);
  }

  void onCancel() {
    loadTheme();
    Get.back();
  }

  Future<void> onSave() async {
    final ThemeMode mode = switch (selectedThemeIndex.value) {
      2 => ThemeMode.dark,
      1 => ThemeMode.light,
      _ => ThemeMode.system,
    };

    currentThemeMode.value = mode;

    await _service.saveThemeMode(mode);

    Get.changeThemeMode(mode);

    Get.back(result: true);
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

  String get getSelectedThemeText {
    return switch (selectedThemeIndex.value) {
      2 => strDark,
      1 => strLight,
      _ => strSystemDefault,
    };
  }
}
