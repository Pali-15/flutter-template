import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
