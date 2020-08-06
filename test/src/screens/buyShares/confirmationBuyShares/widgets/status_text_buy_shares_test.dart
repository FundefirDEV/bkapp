import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/status_text_buy_shares.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test StatusTextBuyShares  Widget', () {
    testWidgets('Render StatusTextBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: StatusTextBuyShares(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('StatusTextBuyShares render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: StatusTextBuyShares()));
      await tester.pumpAndSettle();

      expect(
          find.byKey(Key('status-text-buy-shares-container')), findsOneWidget);
      expect(find.byKey(Key('status-text-buy-shares-text')), findsOneWidget);
    });
  });
}
