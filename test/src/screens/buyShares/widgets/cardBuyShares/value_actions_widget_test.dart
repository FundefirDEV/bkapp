import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/value_actions_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test ValueActions  Widget', () {
    testWidgets('Render ValueActions', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: ValueActions(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('ValueActions render structure', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: ValueActions()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('value-actions-padding')), findsOneWidget);
      expect(find.byKey(Key('value-actions-column-container')), findsOneWidget);
      expect(
          find.byKey(Key('value-actions-column-text-value')), findsOneWidget);
      expect(find.byKey(Key('value-actions-share-value-text')), findsOneWidget);
      expect(find.byKey(Key('value-actions-text-value')), findsOneWidget);
      expect(find.byKey(Key('value-actions-column-text-number-actions')),
          findsOneWidget);
      expect(find.byKey(Key('value-actions-action-available')), findsOneWidget);
      expect(
          find.byKey(Key('value-actions-number-actios-text')), findsOneWidget);
    });
  });
}
