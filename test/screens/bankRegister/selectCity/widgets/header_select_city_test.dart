import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/header_select_city_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test Header Select City Widget', () {
    testWidgets('Find Header Select City widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: HeaderSelectCityWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find structure Header Select City widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: HeaderSelectCityWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsOneWidget);
    });
  });
}
