import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/common_widgets/bottom_navbar.dart';
import 'package:template/presentation/page_1/page_1.dart';
import 'package:template/presentation/page_1/page_1_nested.dart';
import 'package:template/presentation/page_2/page_2.dart';
import 'package:template/router/route_wrapper.dart';
import 'package:template/router/routes.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final RoutesBuilder _builder;
  late final GoRouter _router;

  GoRouter get router => _router;

  AppRouter(RoutesBuilder builder) {
    _builder = builder;
    _router = GoRouter(
      initialLocation: AppRoutes.page1,
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

  RoutesBuilder();
  //Builder functions here
  Widget page1Builder(BuildContext context, GoRouterState state) {
    // If needed read params from routing here, and wrap the child with BlocProviders
    return RouteWrapper(child: Page1());
  }

  Widget page2Builder(BuildContext context, GoRouterState state) {
    return RouteWrapper(child: Page2());
  }

  Widget page1NestedBuilder(BuildContext context, GoRouterState state) {
    return RouteWrapper(child: Page1Nested());
  }
}
