import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test card information', () {
    testWidgets('Find Card Information exist', (WidgetTester tester) async {
      final testKey = Key('card-information-bk');
      await tester.pumpWidget(baseTester(
        child: CardInformationBkWidget(key: testKey)
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
  });
}
