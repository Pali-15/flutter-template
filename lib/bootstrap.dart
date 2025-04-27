import 'package:template/domain/di/di_module.dart';
import 'package:template/domain/di/router_di_module.dart';

final resolveInstance = GetIt.instance;

void createDependencies() {
  Bootstrap.initialize();
}

//Dispose all of the dependencies
void disposeDependencies() {
  DiModule.resetDependencies();
}

sealed class Bootstrap {
  static Future<void> initialize() async {
    // Initialize all the modules here
    List<DiModule> modules = [
      // This should be the last module to be initialized
      RouterDiModule(),
    ];

    for (final module in modules) {
      await module.initialize();
    }
  }

  static Future<void> restartDependencies() async {
    await DiModule.resetDependencies();
    await initialize();
  }
}
