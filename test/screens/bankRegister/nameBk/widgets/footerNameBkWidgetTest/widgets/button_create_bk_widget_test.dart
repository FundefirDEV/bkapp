import 'package:bkapp_flutter/src/screens/bankCreated/bank_created_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/widgets/button_create_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

void main() {
  group('Test render ButtonCreateBkWidget', () {
    testWidgets('Find ButtonCreateBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: ButtonCreateBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure ButtonCreateBkWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: ButtonCreateBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('container-flatbutton-footer')), findsOneWidget);
      expect(find.byKey(Key('flatbutton-create-bk')), findsOneWidget);
      expect(find.byKey(Key('padding-label-button-create')), findsOneWidget);
      expect(find.byKey(Key('text-flatbutton-create')), findsOneWidget);
    });

    testWidgets('ItemCarousel redirect page', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: ButtonCreateBkWidget()));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('flatbutton-create-bk')));
      await tester.pumpAndSettle();
      expect(find.byType(BankCreatedScreen), findsOneWidget);
    });
  });
}
