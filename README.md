# Flutter template to start project

Use this template repository to start new flutter projects

## Features

- Stateful nested routing
- Dependency injections
- Dark/Light theme
- Consistent UI library

## Prerequisites

- Developed with [Flutter 3.29.0](https://docs.flutter.dev/get-started/install)
- Model classes and assets generated with `build_runner`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Architecture

The app follows a clean and modular structure using:

- **Routing**: `go_router` for declarative navigation
- **State Management**: `bloc` for predictable state handling
- **Dependency Injection**: `get_it` for managing service and class instances

## Guidelines

### Folder Structure

- All **UI-related files** should be placed inside the `presentation/` folder.
- Place **state management**, **HTTP calls**, and **dependency injection** logic inside the `domain/` folder.

### Dependency Injection

- Every BLoC and repository should receive its dependencies via constructor injection.
- For each feature/module, create a file under `domain/di/<feature>_di.dart` and define a class that extends `DiModule`.
- Override the `initializeModule` method and register all dependencies inside using `get_it`.
- Register the DI module by pushing an instance of the class into the `modules` list inside the `Bootstrap` class, in the correct order.

### Routing

- Define a builder function for each page inside the `RoutesBuilder` class. Use it to collect all required dependencies for the page (e.g., BLoCs).
- The builder function should always return with a `RouteWrapper` widget
- Declare the route structure and page routing logic inside the `AppRouter`.

### Testing

- Create mocks in `mocks.dart`.
- Use `tester.pumpAppRoute()` for testing routes and `pumpAppWidget()` for testing individual widgets.
- Use the `goNamedExt()` extension function on `BuildContext` for navigating inside widget tests.
- Write proper **widget**, **repository**, and **BLoC** tests for each module.

### UI Guidelines

- Always use **colors** and **text styles** from the app theme. Avoid hardcoded values.
- For buttons, use the predefined `AppButtons`. When adding new buttons, use **factory constructors** for consistent styling across the app.
- Use `ScreenUtil` for all sizing (width, height, padding, radius, etc.). Standard radius values are defined in `AppDimension`.
- Wrap every page with the `BasePage` widget.
- Use `ErrorWidget` to display errors in a consistent manner.
# flutter-template
