import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/text_image_credit_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../../base_tester.dart';

void main() {
  group('Test TextImageCreditStatusWidget  Widget', () {
    testWidgets('Render TextImageCreditStatusWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: TextImageCreditStatusWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('TextImageCreditStatusWidget render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TextImageCreditStatusWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('text-image-credit-column')), findsOneWidget);
      expect(find.byKey(Key('text-image-credit-container')), findsOneWidget);
      expect(
          find.byKey(Key('text-image-credit-container-image')), findsOneWidget);
      expect(find.byKey(Key('text-image-credit-image')), findsOneWidget);
      expect(find.byKey(Key('text-image-credit-text-mut-be')), findsOneWidget);
    });
  });
}
