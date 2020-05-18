import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/widgets/footer_select_city_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test Footer Select City Widget', () {
    testWidgets('Find FooterSelectCity widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterSelectCityWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('Find structure FooterSelectCity widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterSelectCityWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('footer-select-city-container')), findsOneWidget);
      expect(find.byKey(Key('footer-select-city-text-container')), findsOneWidget);
      expect(find.byKey(Key('footer-select-city-image-container')), findsOneWidget);
      expect(find.byType(Row), findsNWidgets(1));
      expect(find.byType(SvgPicture), findsNWidgets(1));
    });
  });
}
