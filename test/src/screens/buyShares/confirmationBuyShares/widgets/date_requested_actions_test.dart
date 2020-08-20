import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/date_requested_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

var response = {
  "myRequest": {
    "sharesRequest": [
      {
        "id": 1,
        "partnerName": "Javier Reyes",
        "amount": 50000,
        "quantity": 5,
        "requestDate": "2020/03/20"
      }
    ],
    "creditRequest": [
      {
        "id": 1,
        "partnerName": "Javier Reyes",
        "amount": 500000,
        "requestDate": "2020/03/20"
      }
    ],
    "paymentInstallmentRequest": [
      {
        "id": 1,
        "partnerName": "Javier Reyes",
        "amount": 200000,
        "requestDate": "2020/04/20"
      }
    ]
  }
};

void main() {
  group('Test DateRequestedActions  Widget', () {
    testWidgets('Render DateRequestedActions', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: DateRequestedActions(
        key: testKey,
        data: response,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('DateRequestedActions render structure',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: DateRequestedActions(data: response)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('date-requested-action-padding')), findsOneWidget);
      expect(find.byKey(Key('date-requested-action-column-contain')),
          findsOneWidget);
      expect(find.byKey(Key('date-requested-action-text-requested-actions')),
          findsOneWidget);
      expect(find.byKey(Key('date-requested-action-text-quantity')),
          findsOneWidget);
      expect(find.byKey(Key('date-requested-action-text-application-date')),
          findsOneWidget);
      expect(find.byKey(Key('date-requested-action-date')), findsOneWidget);
    });
  });
}
