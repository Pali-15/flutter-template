import 'package:template/di/firebase_di_module.dart';
import 'package:template/di/di_module.dart';
import 'package:template/di/page_1_di_module.dart';
import 'package:template/di/router_di_module.dart';

final resolveInstance = GetIt.instance;

void createDependencies() {
  Bootstrap.initialize();
}

void createBaseDependencies() {
  Bootstrap.initalizeBaseDependecies();
}

//Dispose all of the dependencies
void disposeDependencies() {
  DiModule.resetDependencies();
}

sealed class Bootstrap {
  // Dependencies needed at the start of the app
  // Example: Auth, Firebase, ...
  static Future<void> initalizeBaseDependecies() async {
    List<DiModule> modules = [FirebaseDiModule()];
    for (final module in modules) {
      await module.initialize();
    }
  }

  // Dependencies needed after the app is running
  // Example: Buisness logic relate blocs/cubits, router
  static Future<void> initialize() async {
    // Initialize all the modules here
    List<DiModule> modules = [
      Page1DiModule(),
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
