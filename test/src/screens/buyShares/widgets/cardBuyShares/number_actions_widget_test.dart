import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/number_actions_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test NumberActions  Widget', () {
    testWidgets('Render NumberActions', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: NumberActions(key: testKey, myShares: '5')));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('NumberActions render structure', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: NumberActions(myShares: '5')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('number-action-text-column')), findsOneWidget);
      expect(find.byKey(Key('number-action-money-image')), findsOneWidget);
      expect(find.byKey(Key('number-action-value-text')), findsOneWidget);
      expect(find.byKey(Key('number-action-my-action-text')), findsOneWidget);
    });
  });
}
