import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/name_bk_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/footer_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/select_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/title_name_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test render widgets name bk', () {

    testWidgets('Find NameBk Screen', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NameBkScreen(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find BgBankRegister widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BgBankRegister(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find tittle name bk widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: TitleNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find enter name bk widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find footer name bk widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure NameBk Screen', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NameBkScreen(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('container-name-bk-screen')), findsOneWidget);
      expect(find.byKey(Key('column-name-bk-screen')), findsOneWidget);
    });
  });
}
