import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test Widget Carousel', () {
    final testKey = Key('my-id');
    final viewportFraction = 0.8;
    final children = <Widget>[];
    testWidgets('Find Carousel Widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: Carousel(
        key: testKey,
        viewportFraction: viewportFraction,
        children: children,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure carousel', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: Carousel(
        key: testKey,
        viewportFraction: viewportFraction,
        children: children,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('container-carousel')), findsOneWidget);
      expect(find.byKey(Key('page-view-carousel')), findsOneWidget);
    });
  });
}
