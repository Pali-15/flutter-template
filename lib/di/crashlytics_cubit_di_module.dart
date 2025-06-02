import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:template/di/di_module.dart';
import 'package:template/firebase/cubit/crashlytics_cubit.dart';

class CrashlyticsCubitDiModule extends DiModule {
  @override
  void initializeModule(GetIt getIt) {
    getIt.registerSingleton(
        CrashlyticsCubit(crashlytics: FirebaseCrashlytics.instance));
  }
}
