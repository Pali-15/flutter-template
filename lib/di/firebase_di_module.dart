import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:template/di/di_module.dart';
import 'package:template/firebase/analytics_cubit.dart';
import 'package:template/firebase/crashlytics_cubit.dart';

class FirebaseDiModule extends DiModule {
  @override
  void initializeModule(GetIt getIt) {
    getIt
      ..registerSingleton(
          CrashlyticsCubit(crashlytics: FirebaseCrashlytics.instance))
      ..registerSingleton(
          AnalyticsCubit(analytics: FirebaseAnalytics.instance));
  }
}
