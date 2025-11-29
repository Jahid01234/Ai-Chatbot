import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  RxBool isDarkTheme = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void toggleTheme(bool value) async {
    isDarkTheme.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', value);
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedTheme = prefs.getBool('isDarkTheme');
    if (savedTheme != null) {
      isDarkTheme.value = savedTheme;
      Get.changeThemeMode(savedTheme ? ThemeMode.dark : ThemeMode.light);
    }
  }
}
// .