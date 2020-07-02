import 'package:bkapp_flutter/src/widgets/infiniteCarousel/infitite_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test Widget Infinite Carousel', () {
    final testKey = Key('my-id');
    final viewportFraction = 0.8;
    final children = <Widget>[];
    final alignment = Alignment.center;
    testWidgets('Find Infinite Carousel Widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: InfiniteCarousel(
        key: testKey,
        viewportFraction: viewportFraction,
        children: children,
        alignment: alignment,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure infinite carousel',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: InfiniteCarousel(
        key: testKey,
        viewportFraction: viewportFraction,
        children: children,
        alignment: alignment,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('container-infinite-carousel')), findsOneWidget);
      expect(find.byKey(Key('container-pageview-carousel')), findsOneWidget);
      expect(find.byKey(Key('stack-infinite-carousel')), findsNWidgets(3));
      expect(find.byType(AnimatedBuilder), findsNWidgets(5));
    });
  });
}
