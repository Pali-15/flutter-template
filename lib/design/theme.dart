import 'package:flutter/material.dart';

class ThemeSwitcher {
  static final ValueNotifier<bool> _lightThemeNotifier =
      ValueNotifier<bool>(true);

  static ValueNotifier<bool> get lightThemeNotifier => _lightThemeNotifier;

  static switchTheme() =>
      _lightThemeNotifier.value = !_lightThemeNotifier.value;
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
);
