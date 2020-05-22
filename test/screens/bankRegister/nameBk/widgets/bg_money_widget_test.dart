import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/bg_money_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test render widgets bg money', () {

    testWidgets('Find BgMoney Widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BgMoneyWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure BgMoney Widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BgMoneyWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('container-money-bg-svg')), findsOneWidget);
      expect(find.byKey(Key('money-bg-svg')), findsOneWidget);
    });
  });
}
