import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/country_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test Country Carousel Widget', () {
    testWidgets('Find Country Carousel widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: CountryCarousel(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });
  });
}
