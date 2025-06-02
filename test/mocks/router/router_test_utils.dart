import 'package:template/router/router.dart';
import 'package:template/screens/page_1/bloc/bloc.dart';

import '../bloc_mocks.dart';

RoutesBuilder buildTestRoutesBuilder({
  Page1Bloc? page1Bloc,
}) {
  return RoutesBuilder(
    page1bloc: page1Bloc ?? MockPage1Bloc(),
  );
}
