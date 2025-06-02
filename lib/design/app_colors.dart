import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;

  AppColors(this.context);

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  Color createColor(Color colorLight, Color colorDark) =>
      isDark ? colorDark : colorLight;

  Color get navbarItem => Colors.blue;
  Color get switcherActive => Colors.green;

  static const Color _background = Color(0xFFFFFFFF);
  static const Color _backgroundDark = Color(0xFF121212);
  Color get background => createColor(_background, _backgroundDark);

  static const _textColor = Colors.black;
  static const _textColorDark = Colors.white;
  Color get defaultTextColor => createColor(_textColor, _textColorDark);

  static const _invertedTextColor = Colors.white;
  static const _invertedTextColorDark = Colors.black;
  Color get invertedTextColor =>
      createColor(_invertedTextColor, _invertedTextColorDark);

  static const _buttonColor = Color.fromARGB(255, 55, 55, 55);
  static const _buttonColorDark = Color.fromARGB(255, 200, 200, 200);
  Color get buttonColor => createColor(_buttonColor, _buttonColorDark);

  static AppColors of(BuildContext context) => AppColors(context);
}
