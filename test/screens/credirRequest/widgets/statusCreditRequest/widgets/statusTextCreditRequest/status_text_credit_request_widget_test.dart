import 'package:bkapp_flutter/src/screens/creditRequest/widgets/statusCreditRequest/widgets/statusTextCreditRequest/status_text_credit_request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

void main() {
  group('Test StatusTextCreditRequest  Widget', () {
    testWidgets('Render StatusTextCreditRequest', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: StatusTextCreditRequest(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('StatusTextCreditRequest render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: StatusTextCreditRequest()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('status-text-credit-request-container')),
          findsOneWidget);
      expect(
          find.byKey(Key('status-text-credit-request-column')), findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-expanded')),
          findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-container-status')),
          findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-container-richtext')),
          findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-sizedbox')),
          findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-expanded-dues')),
          findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-container-dues')),
          findsOneWidget);
      expect(find.byKey(Key('status-text-credit-request-text-dues')),
          findsOneWidget);
    });
  });
}
