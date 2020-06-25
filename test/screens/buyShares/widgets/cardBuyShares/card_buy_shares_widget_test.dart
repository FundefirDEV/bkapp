import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/card_buy_shares_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test CardBuyShares  Widget', () {
    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: CardBuyShares(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('CardBuyShares render structure', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: CardBuyShares()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('card-buy-share-principal-container')),
          findsOneWidget);
      expect(find.byKey(Key('row-card-buy-share')), findsOneWidget);
      expect(find.byKey(Key('blue-container-card-buy-share')), findsOneWidget);
      expect(find.byKey(Key('expanded-card-buy-share')), findsOneWidget);
      expect(find.byKey(Key('white-container-card-buy-share')), findsOneWidget);
    });
  });
}
