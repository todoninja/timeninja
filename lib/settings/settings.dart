import 'package:shared_preferences/shared_preferences.dart';

export 'view/settings.dart';

class Settings {
  static const String _keyHoursPerWeek = 'hoursPerWeek';
  static const String _keyTaskMode = 'taskMode';

  static Future<int> getHoursPerWeek() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyHoursPerWeek) ?? 38;
  }

  static Future<void> setHoursPerWeek(int hours) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyHoursPerWeek, hours);
  }

  static Future<bool> getTaskMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyTaskMode) ?? false;
  }

  static Future<void> setTaskMode({required bool taskMode}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyTaskMode, taskMode);
  }
}
