import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class ThemeProvider with ChangeNotifier {
  // lightMode
  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade100,
      primary: Colors.grey.shade300,
      inversePrimary: Colors.grey.shade400,
      tertiary: Colors.grey.shade700,
    ),
  );

  // dartMode
  ThemeData dartMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade800,
      primary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade600,
      tertiary: Colors.grey.shade200,
    ),
  );

  AppTheme _currentTheme = AppTheme.light;

  ThemeData get themedata {
    switch (_currentTheme) {
      case AppTheme.dark:
        return dartMode;
      case AppTheme.light:
        return lightMode;
    }
  }

  toggleTheme() {
    if (_currentTheme == AppTheme.light) {
      _currentTheme = AppTheme.dark;
    } else {
      _currentTheme = AppTheme.light;
    }
    notifyListeners();
  }
}
