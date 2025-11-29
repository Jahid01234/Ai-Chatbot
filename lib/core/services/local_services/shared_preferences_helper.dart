import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _isFirstTimeKey = 'isFirstTime';

  static Future<bool> getIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstTimeKey) ?? true;
  }

  static Future<void> setIsFirstTime(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstTimeKey, value);
  }
}