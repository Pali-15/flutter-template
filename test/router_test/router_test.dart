import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template/router/router.dart';
import 'package:template/router/routes.dart';
import 'package:template/screens/page_1/bloc/bloc.dart';
import 'package:template/screens/page_1/page_1.dart';
import 'package:template/screens/page_1/page_1_nested.dart';
import 'package:template/screens/page_2/page_2.dart';

import '../mocks/bloc_mocks.dart';
import '../mocks/router/router_test_utils.dart';
import '../test_extension.dart';

void main() {
  group('Test navigetion on page 1', () {
    late Page1Bloc page1bloc;
    late RoutesBuilder routesBuilder;

    setUp(() {
      page1bloc = MockPage1Bloc();
      routesBuilder = buildTestRoutesBuilder(page1Bloc: page1bloc);
    });
    testWidgets('App will init at page 1', (tester) async {
      when(
        () => page1bloc.state,
      ).thenReturn(Page1BlocState.loaded(['1']));

      await tester.pumpAppRoute(AppRouter(routesBuilder),
          route: AppRoutes.page1);

      expect(find.byType(Page1), findsOneWidget);
    });

    testWidgets('App will go tp page 1 nested', (tester) async {
      when(
        () => page1bloc.state,
      ).thenReturn(Page1BlocState.loaded(['1']));

      await tester.pumpAppRoute(AppRouter(routesBuilder),
          route: AppRoutes.page1);

      await tester.pumpAndSettle();

      expect(find.byType(Page1), findsOneWidget);

      await tester.tap(find.text('Go to nested page'));
      await tester.pumpAndSettle();

      expect(find.byType(Page1Nested), findsOneWidget);
    });
  });

  group('Test navigetion on page 2', () {
    late RoutesBuilder routesBuilder;
    setUp(() {
      routesBuilder = buildTestRoutesBuilder();
    });
    testWidgets('App will init at page 2', (tester) async {
      await tester.pumpAppRoute(AppRouter(routesBuilder, AppRoutes.page2),
          route: AppRoutes.page2);

      expect(find.byType(Page2), findsOneWidget);
    });
  });
}
