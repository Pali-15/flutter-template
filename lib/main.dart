// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/bootstrap.dart';
import 'package:template/router/router.dart';
import 'package:template/design/theme.dart';

Future<void> main() async {
  // -------- FIREBASE RELATED  --------
  // UNCOMMENT AFTER FIREBASE IS SET UP
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // createBaseDependencies();
  // -------- END OF FIREBASE RELATED --------
  createDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter router;
  @override
  void initState() {
    router = resolveInstance();
    super.initState();
  }

  @override
  void dispose() {
    disposeDependencies();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeSwitcher.lightThemeNotifier,
      builder: (context, lightThemeEnabled, _) => ScreenUtilInit(
        designSize: const Size(360, 843),
        minTextAdapt: true,
        builder: (context, _) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'App',
          routerConfig: router.router,
          theme: lightThemeEnabled ? lightTheme : darkTheme,
        ),
      ),
    );
  }
}
