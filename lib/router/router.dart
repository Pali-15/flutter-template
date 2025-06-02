import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/common_widgets/bottom_navbar.dart';
import 'package:template/screens/page_1/bloc/bloc.dart';
import 'package:template/screens/page_1/page_1.dart';
import 'package:template/screens/page_1/page_1_nested.dart';
import 'package:template/screens/page_2/page_2.dart';
import 'package:template/router/route_wrapper.dart';
import 'package:template/router/routes.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final RoutesBuilder _builder;
  late final GoRouter _router;
  late final String? _initialLocation;

  GoRouter get router => _router;

  AppRouter(this._builder, [this._initialLocation]) {
    _router = GoRouter(
      initialLocation: _initialLocation ?? AppRoutes.page1,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => BottomNavbar(
            navigationShell: navigationShell,
          ),
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.page1,
                  name: AppRoutes.page1,
                  builder: _builder.page1Builder,
                  routes: [
                    GoRoute(
                      path: AppRoutes.page1Nested,
                      name: AppRoutes.page1Nested,
                      builder: _builder.page1NestedBuilder,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.page2,
                  name: AppRoutes.page2,
                  builder: _builder.page2Builder,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class RoutesBuilder {
  //Declare dependencies here (example: bloc)
  late final Page1Bloc page1bloc;

  RoutesBuilder({required this.page1bloc});
  //Builder functions here
  Widget page1Builder(BuildContext context, GoRouterState state) {
    // If needed read params from routing here, and wrap the child with BlocProviders
    return RouteWrapper(
      child: Page1(),
    );
  }

  Widget page2Builder(BuildContext context, GoRouterState state) {
    return RouteWrapper(child: Page2());
  }

  Widget page1NestedBuilder(BuildContext context, GoRouterState state) {
    return RouteWrapper(
      onInit: () => page1bloc.add(Page1BlocEvent.load()),
      child: BlocProvider.value(
        value: page1bloc,
        child: Page1Nested(),
      ),
    );
  }
}
