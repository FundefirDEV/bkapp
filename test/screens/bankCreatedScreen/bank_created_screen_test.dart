import 'package:bkapp_flutter/src/screens/bankCreated/bank_created_screen.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/menu_navigator_screen.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../base_tester.dart';

void main() {
  group('Test bank_created_screen', () {
    testWidgets('Find LoginScreen widget', (WidgetTester tester) async {
      final columnKey = Key('column_bank_created_screen');
      final textKey = Key('richText_bank_created_screen');

      await tester.pumpWidget(baseTester(child: BankCreatedScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(columnKey), findsNWidgets(1));
      expect(find.byKey(textKey), findsNWidgets(1));
    });
    testWidgets('Find image and text', (WidgetTester tester) async {
      final svgKey = Key('svgPicture_bank_created');

      await tester.pumpWidget(baseTester(child: BankCreatedScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(svgKey), findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  "¡VERY GOOD!\nsuperBk has been created"),
          findsOneWidget);
    });

    testWidgets('Go to the next screen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: BankCreatedScreen()));
      await tester.pumpAndSettle();
      
      await tester.tap(find.byType(ButtonNextWidget));
      await tester.pumpAndSettle();

      expect(find.byType(MenuNavigatorScreen), findsOneWidget);
    });
  });
}
