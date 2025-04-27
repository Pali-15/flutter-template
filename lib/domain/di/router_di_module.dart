import 'package:template/domain/di/di_module.dart';
import 'package:template/router/router.dart';

class RouterDiModule extends DiModule {
  @override
  void initializeModule(GetIt getIt) {
    getIt
      ..registerSingleton(
        RoutesBuilder(),
      )
      ..registerSingleton(
        AppRouter(getIt.get<RoutesBuilder>()),
      );
  }
}
