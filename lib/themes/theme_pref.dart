import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs {
  static const themeType = "THEMETYPE";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeType, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeType) ?? false;
  }
}
