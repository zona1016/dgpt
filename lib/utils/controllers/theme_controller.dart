import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _currentThemeMode = ThemeMode.light.obs;

  ThemeMode get currentThemeMode => _currentThemeMode.value;

  bool get isDarkMode => currentThemeMode == ThemeMode.dark;

  void toggleTheme() {
    Get.changeThemeMode(ThemeMode.light);
  }
}
