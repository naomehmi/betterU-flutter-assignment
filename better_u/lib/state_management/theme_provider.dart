import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _lightTheme = ThemeData.light();
  ThemeData _darkTheme = ThemeData.dark();

  ThemeType _themeType = ThemeType.light;

  ThemeData get themeData => _themeType == ThemeType.light ? _lightTheme : _darkTheme;
  ThemeType get themeType => _themeType;

  void setTheme(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }
}
