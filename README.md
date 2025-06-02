# Flutter Template Project

Use this template repository to kickstart new Flutter projects.

---

## 🚀 Features

- Stateful nested routing with `go_router`
- Dependency injection with `get_it`
- Dark/Light theme support
- Consistent UI system with design tokens
- Firebase-ready (commented until setup)
- Mason brick generator for BLoCs

---

## 🛠 Prerequisites

- Developed using [Flutter 3.29.0](https://docs.flutter.dev/get-started/install)
- Code generation via `build_runner`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🧱 Architecture Overview

This project follows a clean, modular structure:

| Layer               | Technology        |
|---------------------|------------------|
| Routing             | `go_router`      |
| State Management    | `bloc`, `cubit`  |
| Dependency Injection| `get_it`         |

---

## 📁 Folder Structure

```
lib/
├── assets_gen/     # Generated assets
├── common_widgets/ # Commonly used widget
├── design/         # Colors, Spacing, Radius, Theme, Text Styles
├── di/             # All of the DI modules for dependency injections
├── extensions/     # Commonly used extensions
├── firebase/       # Firebase related files
├── router/         # All files related to routing
├── screen/         # Screens and the corresponding blocs and repositories
├── utils/          # Util classes
├── bootstrap.dart/ # Class to handle dependency injection of the DI modules
└── main.dart
```

---

## 🧩 Dependency Injection

- Every BLoC and repository receives dependencies via constructor injection.
- Create a file in `lib/domain/di/` like `<feature>_di.dart`.
- Implement a class extending `DiModule`, override `initializeModule()`, and register everything with `GetIt`.

**Example**:

```dart
class MyFeatureDiModule extends DiModule {
  @override
  Future<void> initialize() async {
    getIt.registerFactory(() => MyFeatureBloc(...));
  }
}
```

- Add the module to `Bootstrap.initalizeDependecies()` in correct order or if that dependency needed at the start of the app like firebase `Bootstrap.initalizeBaseDependecies()`

---

## 🧭 Routing

- Route builders live in `RoutesBuilder`:
  - Should create and inject required BLoCs
  - Always return a `RouteWrapper` widget

- Declare the GoRouter config in `AppRouter`.

---

## 🧪 Testing

- Create mocks inside `test/utils/mocks.dart`
- For `pumpAppRoute` create a `RoutesBuilder` with only the needed dependencies mocked
```dart
page1bloc = MockPage1Bloc();
routesBuilder = buildTestRoutesBuilder(page1Bloc: page1bloc);
await tester.pumpAppRoute(AppRouter(routesBuilder),
          route: AppRoutes.page1);
```

- Use these extensions for test setup:
```dart
tester.pumpAppWidget(MyWidget());
```


- Add tests for:
  - Widget rendering
  - Bloc behavior
  - Repository logic

---

## 🎨 UI Guidelines

- **Never hardcode colors or text styles**
- Use `AppColors` and `AppTextStyles` for consistency
- Use `AppButtons` with factory constructors
- All dimensions must use `ScreenUtil`:
  - `.w`, `.h`, `.sp`, `.r`
- Wrap pages with `BasePage`
- Use `ErrorWidget` for displaying error messages

---

## 🔥 Firebase Integration

Firebase is set up but disabled by default.

To enable:

1. Run `flutterfire configure`
2. Replace `firebase_options.dart` with your generated file
3. Uncomment relevant code in:
   - `main.dart`
   - `CrashlyticsCubit`, `AnalyticsCubit`, etc.

---

## 🧱 Mason Setup

Mason is pre-configured for generating BLoCs.

To use:

1. Open a terminal in the desired folder (e.g. `lib/screens/page_1`)
2. Run:

```bash
mason make bloc --bloc_name my_feature
```

This generates:

```
bloc/
├── bloc.dart      // class MyFeatureBloc
├── state.dart     // class MyFeatureState
└── event.dart     // class MyFeatureEvent
```

You can edit the Mason brick in `/bricks/bloc/` to customize the structure and code.

---

## 🧼 Best Practices

- Keep business logic inside blocs or services — **no async in UI**
- Never mutate state directly; always emit new states
- Use factory constructors and sealed classes where appropriate
- Use `freezed` for immutable models and state/event unions
- Write unit tests for every core logic
- Keep screens thin, focused on layout and interaction

---

## 📌 Notes

- Use `ThemeSwitcher` to toggle between light and dark themes
- Use `AppSpacing` instead of raw `EdgeInsets`
- `ScreenUtilInit` is required at the root of the widget tree

---

Made by Pali-15