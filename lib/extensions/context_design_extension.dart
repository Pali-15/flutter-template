import 'package:flutter/material.dart';
import 'package:template/design/app_colors.dart';
import 'package:template/design/app_text_styles.dart';

extension ContextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.of(this);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles.of(this);
}
