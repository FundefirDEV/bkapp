import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test BgCountry Widget', () {
    testWidgets('Find BgCountry widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BgCountry(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find structure BgCountry widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BgCountry(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(Key('material-bg-country')), findsOneWidget);
      expect(find.byKey(Key('container-bg-country')), findsOneWidget);
    });
  });
}
