import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final box = GetStorage();

  Future<void> saveThemeMode(ThemeMode mode) async {
    await box.write(
      LocalStorageKeys.themeMode.name,
      mode.name,
    );
  }

  ThemeMode getThemeMode() {
    final storedMode = box.read(
      LocalStorageKeys.themeMode.name,
    );

    return ThemeMode.values.firstWhere(
          (e) => e.name == storedMode,
      orElse: () => ThemeMode.system,
    );
  }
}

enum LocalStorageKeys {
  themeMode,
  dark,
  light,
  system
}