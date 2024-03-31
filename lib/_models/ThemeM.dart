import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeM extends ChangeNotifier {
  Brightness theme = Brightness.dark;

  void setDarkMode() {
    theme = Brightness.dark;

    notifyListeners();
  }

  void setLightMode() {
    theme = Brightness.light;

    notifyListeners();
  }

  currentTheme() {
    if (theme == Brightness.dark) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}
