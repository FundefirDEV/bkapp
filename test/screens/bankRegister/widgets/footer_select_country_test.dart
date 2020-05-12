import 'package:bkapp_flutter/src/screens/bankRegister/selectCountry/widgets/footer_select_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test Footer Select Country Widget', () {
    testWidgets('Find FooterSelectCountry widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterSelectCountry(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find structure FooterSelectCountry widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterSelectCountry(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(Key('footer-select-country-container')), findsOneWidget);
      expect(find.byKey(Key('footer-select-country-text-container')), findsOneWidget);
      expect(find.byKey(Key('footer-select-country-image-container')), findsOneWidget);
      expect(find.byType(Row), findsNWidgets(1));
      expect(find.byType(SvgPicture), findsNWidgets(1));
    });
  });
}
