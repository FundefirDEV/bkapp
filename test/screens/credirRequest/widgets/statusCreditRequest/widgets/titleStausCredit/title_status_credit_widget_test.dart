import 'package:bkapp_flutter/src/screens/credirRequest/widgets/statusCreditRequest/widgets/titleStausCredit/title_status_credit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

void main() {
  group('Test TitleStatusCreditWidget  Widget', () {
    testWidgets('Render TitleStatusCreditWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleStatusCreditWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('TitleStatusCreditWidget render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TitleStatusCreditWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('title-status-credit-container')), findsOneWidget);
      expect(
          find.byKey(Key('row-title-status-credit-container')), findsOneWidget);
      expect(find.byKey(Key('left-arrow-image-container-title-status-credit')),
          findsOneWidget);
      expect(find.byKey(Key('image-left-arrow-title-status-credit')),
          findsOneWidget);
      expect(find.byKey(Key('title-status-credit-container-text')),
          findsOneWidget);
      expect(find.byKey(Key('title-status-credit-text')), findsOneWidget);
    });
  });
}
