import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/select_city_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test EnterCityState Widget', () {
    testWidgets('Find EnterCityState widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectCityStateWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });


    testWidgets('Find structure EnterCityState widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectCityStateWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('material-content-city-state')), findsOneWidget);
      expect(find.byKey(Key('container-content-city-state')), findsOneWidget);
      expect(find.byKey(Key('theme-dropdown-state')), findsOneWidget);
      expect(find.byKey(Key('theme-dropdown-city')), findsOneWidget);
      expect(find.byKey(Key('align-container-division-dropdowns')), findsOneWidget);
      expect(find.byKey(Key('container-division-dropdowns')), findsOneWidget);
      expect(find.byKey(Key('list-state')), findsNWidgets(2));
      expect(find.byKey(Key('list-city')),  findsNWidgets(2));
    });
  });
}
