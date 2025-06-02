import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/design/app_colors.dart';
import 'package:template/design/app_text_styles.dart';

extension ContextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension ContextRouteExtension on BuildContext {
  void gonNamedExt(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return GoRouter.of(this).goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.of(this);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles.of(this);
}
