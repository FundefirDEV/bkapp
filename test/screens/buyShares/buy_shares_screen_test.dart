import 'package:bkapp_flutter/src/screens/buyShares/buy_shares_screen.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/card_buy_shares_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test BuySharesScreen  Widget', () {
    testWidgets('Render BuySharesScreen', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BuySharesScreen(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TitleBuyShareWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleBuyShareWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: CardBuyShares(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render SharesBuyText', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: SharesBuyText(key: testKey, textBuyShares: true)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('BuySharesScreen render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: BuySharesScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('material-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('scroll-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('appbar-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('bloc-provider-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('builder-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('container-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('bloc-listener-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('column-buy-share-screen')), findsOneWidget);
    });
  });
}
