import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'Poppins',
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorScheme: isDarkTheme
          ? ColorScheme.dark(
              background: Colors.grey.shade900,
              primary: Colors.grey.shade800,
              secondary: Colors.white30,
              inversePrimary: Colors.grey.shade300,
            )
          : ColorScheme.light(
              background: Colors.grey.shade300,
              primary: Colors.grey.shade200,
              secondary: Colors.white,
              inversePrimary: Colors.grey.shade700,
            ),
      primaryColor: isDarkTheme ? Colors.grey.shade800 : Colors.grey.shade200,
    );
  }
}
