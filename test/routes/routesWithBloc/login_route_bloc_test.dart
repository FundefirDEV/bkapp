import 'package:bkapp_flutter/src/routes/routesWithBloc/login_route_bloc.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group(
    'Test login route states and widgets',
    () {
      testWidgets('Test if exist MultiBlocProvider', (WidgetTester tester) async {
        await tester.pumpWidget(baseTester(
          child: loginRouteBloc()
        ));
        await tester.pumpAndSettle();

        expect(find.byType(MultiBlocProvider), findsOneWidget);
      });

      testWidgets(
        'Test all the widgets in the route',
        (WidgetTester tester) async {
          await tester.pumpWidget(baseTester(
            child: loginRouteBloc()
          ));
          await tester.pumpAndSettle();

          expect(find.byType(LoginScreen), findsOneWidget);
        }
      );
    }
  );
}
