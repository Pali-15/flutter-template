import 'package:template/di/di_module.dart';
import 'package:template/screens/page_1/bloc/bloc.dart';

class Page1DiModule extends DiModule {
  @override
  void initializeModule(GetIt getIt) {
    getIt.registerLazySingleton(() => Page1Bloc());
  }
}
