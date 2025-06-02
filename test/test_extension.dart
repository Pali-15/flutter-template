import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:template/router/router.dart';

extension PumpAppExtension on WidgetTester {
  // Since all of the baseDependencies will live on top of the app, we should mock them here to give them a default behaviour in the test enviroment,
  // give the possibility to overwrite that behaviour
  Future<void> pumpAppRoute(
    AppRouter router, {
    String? route,
    Map<String, dynamic>? extra,
  }) async {
    Widget app = ScreenUtilInit(
      designSize: const Size(360, 843),
      minTextAdapt: true,
      builder: (context, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'App',
        routerConfig: router.router,
      ),
    );

    await pumpWidget(app);
    await pumpAndSettle();

    if (route != null) {
      var context = router.router.routerDelegate.navigatorKey.currentContext;
      context?.goNamed(route, extra: extra);
    }
    await pumpAndSettle();
  }

  Future<void> pumpAppWidget(Widget child) async {
    await pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 843),
        minTextAdapt: true,
        builder: (_, __) => MaterialApp(
          home: Scaffold(body: child),
        ),
      ),
    );
  }
}
