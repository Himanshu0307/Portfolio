import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeM extends ChangeNotifier {
  Brightness theme = Brightness.dark;

  void setDarkMode() {
    theme = Brightness.dark;
    print("Current Theme:Dark");
    notifyListeners();
  }

  void setLightMode() {
    theme = Brightness.light;
    print("Current Theme:Light");
    notifyListeners();
  }

  currentTheme() {
    if (theme == Brightness.dark) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}
