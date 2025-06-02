import 'package:template/di/di_module.dart';
import 'package:template/router/router.dart';
import 'package:template/screens/page_1/bloc/bloc.dart';

class RouterDiModule extends DiModule {
  @override
  void initializeModule(GetIt getIt) {
    getIt
      ..registerSingleton(
        RoutesBuilder(
          page1bloc: getIt.get<Page1Bloc>(),
        ),
      )
      ..registerSingleton(
        AppRouter(
          getIt.get<RoutesBuilder>(),
        ),
      );
  }
}
