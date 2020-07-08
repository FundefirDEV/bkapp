import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/card_buy_shares_widget.dart';
import 'package:bkapp_flutter/src/screens/credirRequest/widgets/statusCreditRequest/status_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/credirRequest/widgets/statusCreditRequest/widgets/statusTextCreditRequest/status_text_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/credirRequest/widgets/statusCreditRequest/widgets/textImageCreditStatus/text_image_credit_status_widget.dart';
import 'package:bkapp_flutter/src/screens/credirRequest/widgets/statusCreditRequest/widgets/titleStausCredit/title_status_credit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test StatusCreditRequestWidget  Widget', () {
    testWidgets('Render StatusCreditRequestWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: StatusCreditRequestWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TitleStatusCreditWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleStatusCreditWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: CardBuyShares(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render StatusTextCreditRequest', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: StatusTextCreditRequest(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TextImageCreditStatusWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: TextImageCreditStatusWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('StatusCreditRequestWidget render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: StatusCreditRequestWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('status-credit_request-widget-column')),
          findsOneWidget);
      expect(find.byKey(Key('status-credit_request-widget-container-text')),
          findsOneWidget);
      expect(
          find.byKey(Key('status-credit_request-widget-text')), findsOneWidget);
    });
  });
}
