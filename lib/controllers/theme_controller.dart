import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> currentThemeMode = ThemeMode.system.obs;

  setTheme() {
    currentThemeMode.value = currentThemeMode.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    update();
  }
}
