import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/name_bk_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test render widgets NameBkFormWidget', () {

    testWidgets('Find BgMoney Widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NameBkFormWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure NameBkFormWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NameBkFormWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('theme-input-namebk')), findsOneWidget);
      expect(find.byKey(Key('input-namebk')), findsOneWidget);
    });

    testWidgets('Enter namebk into TextField', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(child: NameBkFormWidget())
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(Key('input-namebk')),
        'Bank Name'
      );

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('Bank Name'), findsOneWidget);
    });
  });
}
