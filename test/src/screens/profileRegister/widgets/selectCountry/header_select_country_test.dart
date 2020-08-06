import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_select_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test Header Select Country Widget', () {
    testWidgets('Find Header Select Country widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: HeaderCountry(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find structure Header Select Country widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: HeaderCountry(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(Container), findsOneWidget);
    });
  });
}
