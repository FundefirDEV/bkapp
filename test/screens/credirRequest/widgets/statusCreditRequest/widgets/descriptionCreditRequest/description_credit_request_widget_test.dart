import 'package:bkapp_flutter/src/screens/creditRequest/widgets/statusCreditRequest/widgets/descriptionCreditRequest/description_credit_request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

void main() {
  group('Test DescriptionCreditRequestWidget  Widget', () {
    testWidgets('Render DescriptionCreditRequestWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: DescriptionCreditRequestWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('DescriptionCreditRequestWidget render structure',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: DescriptionCreditRequestWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('description-credit-request-container')),
          findsOneWidget);
      expect(
          find.byKey(Key('description-credit-request-column')), findsOneWidget);
      expect(
          find.byKey(Key('description-credit-request-expanded-status-request')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('description-credit-request-container-status-request')),
          findsOneWidget);
      expect(
          find.byKey(Key('description-credit-request-column-status-request')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-text-status-request')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-text-value')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-sized-box')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-expanded-date')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-container-date')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-column-date')),
          findsOneWidget);
      expect(find.byKey(Key('description-credit-request-text-date')),
          findsOneWidget);
      expect(
          find.byKey(Key('description-credit-request-date')), findsOneWidget);
    });
  });
}
