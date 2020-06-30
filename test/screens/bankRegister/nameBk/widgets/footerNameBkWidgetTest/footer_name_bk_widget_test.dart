import 'package:bkapp_flutter/src/screens/bankCreated/bank_created_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/footer_name_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test render FooterNameBkWidget', () {

    testWidgets('Find FooterNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure FooterNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('footer-name-bk-container')), findsOneWidget);
      expect(find.byKey(Key('column-footer-namebk')), findsOneWidget);
    });

    testWidgets('Test the next step', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: FooterNameBkWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('footer-button-next-step')), findsOneWidget);
      await tester.tap(find.byKey(Key('footer-button-next-step')));
      await tester.pumpAndSettle();
      expect(find.byType(BankCreatedScreen), findsOneWidget);
    });

  });
}
