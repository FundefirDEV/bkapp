import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test TitleBuyShareWidget  Widget', () {
    testWidgets('Render TitleBuyShareWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleBuyShareWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('TitleBuyShareWidget render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TitleBuyShareWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('title-buy-share-container')), findsOneWidget);
      expect(find.byKey(Key('row-title-buy-share-container')), findsOneWidget);
      expect(find.byKey(Key('left-arrow-image-container-title-buy-share')),
          findsOneWidget);
      expect(
          find.byKey(Key('image-left-arrow-title-buy-share')), findsOneWidget);
      expect(find.byKey(Key('title-buy-share-container-text')), findsOneWidget);
      expect(find.byKey(Key('title-buy-share-text')), findsOneWidget);
    });
  });
}
