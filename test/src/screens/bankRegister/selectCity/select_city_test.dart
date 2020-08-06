import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/select_city_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/footer_select_city_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/header_select_city_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/select_city_state_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/bg_bank_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test render widgets select city and state', () {

    testWidgets('Find SelectCity widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectCityScreen(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find BgBankRegister widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: BgBankRegister(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find header select city widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: HeaderSelectCityWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find selecttion city and state widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectCityStateWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find footer select city widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterSelectCityWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
  });
}
