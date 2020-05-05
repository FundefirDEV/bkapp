import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/homeTest/home_test_screen.dart';
import 'package:bkapp_flutter/src/screens/introRegister/intro_register_screen.dart';
import 'package:bkapp_flutter/src/screens/introRegister/items_carousel.dart';
import 'package:bkapp_flutter/src/screens/introRegister/widgets/footer_intro.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/gender_screen.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test IntroScreen Widget', () {

    List<ItemCarousel> characters = [
      ItemCarousel(
        text1: 'Text 1',
        text2: 'Text 2',
        image: 'assets/images/robot_read.svg',
        iconText: 'Text 3',
        icon: 'assets/images/icon_media.svg',
        onPressed: (context) => Navigator.pushNamed(context, genderRoute)
      )
    ];
    testWidgets('Find FooterIntro widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterIntro(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    testWidgets('Find Carousel widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
       List<ItemCarousel> characters = [
          ItemCarousel(
            text1: 'Text 1',
            text2: 'Text 2',
            image: 'assets/images/robot_read.svg',
            iconText: 'Text 3',
            icon: 'assets/images/icon_media.svg'
          )
        ];
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    testWidgets('Know a Bk onPressed push to Home Test', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: IntroRegisterScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('itemCarousel-create-bk')), findsOneWidget);

      await tester.tap(find.byKey(Key('itemCarousel-known-bk')));
      await tester.pumpAndSettle();
      expect(find.byType(HomeTestScreen), findsOneWidget);
    });

    testWidgets('Know a Bk onPressed push to Home Test', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: IntroRegisterScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('itemCarousel-create-bk')), findsOneWidget);

      await tester.drag(find.byType(PageView), const Offset(-300.0, 0.0));
      await tester.pumpAndSettle(Duration(milliseconds: 100));

      await tester.tap(find.byKey(Key('itemCarousel-create-bk')));
      await tester.pumpAndSettle();
      expect(find.byType(GenderScreen), findsOneWidget);
    });
  });
}
