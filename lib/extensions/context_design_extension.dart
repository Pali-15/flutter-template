import 'package:flutter/material.dart';
import 'package:template/design/app_colors.dart';
import 'package:template/design/app_text_styles.dart';

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.of(this);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles.of(this);
}
