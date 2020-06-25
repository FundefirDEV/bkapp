import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/shares_buy_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test SharesBuyText  Widget', () {
    testWidgets('Render SharesBuyText', (WidgetTester tester) async {
      final testKey = Key('my-id');
      final textBuyShares = true;
      await tester.pumpWidget(baseTester(
          child: SharesBuyText(key: testKey, textBuyShares: textBuyShares)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('SharesBuyText render structure textBuyShares false',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      final textBuyShares = false;
      await tester.pumpWidget(baseTester(
          child: SharesBuyText(key: testKey, textBuyShares: textBuyShares)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('shares-buy-text-column')), findsOneWidget);
      expect(find.byKey(Key('shares-buy-text-container')), findsOneWidget);
      expect(
          find.byKey(Key('shares-buy-text-container-image')), findsOneWidget);
      expect(find.byKey(Key('shares-buy-text-image')), findsOneWidget);
      expect(find.byKey(Key('shares-buy-text-must-be')), findsOneWidget);
    });

    testWidgets('SharesBuyText render structure textBuyShares true',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      final textBuyShares = true;
      await tester.pumpWidget(baseTester(
          child: SharesBuyText(key: testKey, textBuyShares: textBuyShares)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('shares-buy-text-how-many')), findsOneWidget);
    });
  });
}
