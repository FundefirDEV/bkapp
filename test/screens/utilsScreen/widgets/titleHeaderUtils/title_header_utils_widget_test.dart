import 'package:bkapp_flutter/src/screens/utils/widgets/titleHeaderUtils/title_header_utils_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test TitleHeaderUtilsWidget Widget', () {
    testWidgets('Find TitleHeaderUtilsWidget widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleHeaderUtilsWidget(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure TitleHeaderUtilsWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleHeaderUtilsWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('title-util-container')), findsOneWidget);
      expect(find.byKey(Key('row-title-container')), findsOneWidget);
      expect(find.byKey(Key('left-arrow-image-container-title-util')),
          findsOneWidget);
      expect(find.byKey(Key('image-left-arrow-title-util')), findsOneWidget);
      expect(find.byKey(Key('title-util-container-text')), findsOneWidget);
      expect(find.byKey(Key('title-util-text')), findsOneWidget);
    });
  });
}
