import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/themes/theme_pref.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePrefs = ThemePrefs();
  bool _darktheme = false;

  bool get getDarkTheme => _darktheme;
  set setDarkTheme(bool value) {
    _darktheme = value;
    themePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
