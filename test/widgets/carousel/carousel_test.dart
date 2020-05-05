import 'package:bkapp_flutter/src/screens/introRegister/items_carousel.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test Carousel Widget', () {
    List<ItemCarousel> characters = [
      ItemCarousel(
        text1: 'Text 1',
        text2: 'Text 2',
        image: 'assets/images/robot_read.svg',
        iconText: 'Text 3',
        icon: 'assets/images/icon_media.svg'
      )
    ];
    testWidgets('Find carousel widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find container widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      var container = find.byType(Container);
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(6));
    });

    testWidgets('Find stack widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      var container = find.byKey(Key('stack-carousel-container'));
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });

    testWidgets('Find stack container widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      var container = find.byKey(Key('stack-carousel-container'));
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });

    testWidgets('Find widget align with container shadow widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      var container = find.byKey(Key('shadow-carousel-container'));
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });

    testWidgets('Find widget image container', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      var container = find.byKey(Key('image-carousel-container'));
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });

    testWidgets('Find widget icon information', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: Carousel(key: testKey, item: characters[0])));
      var container = find.byKey(Key('icon-carousel-container'));
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });
  });
}
