import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/widgets/title_image_bottom_modal_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test TitleImageBottomModalWidget', () {
    final testKey = Key('my-id');
    bool isBold = true;
    String title = 'Test';
    String titleBold = 'Test';

    testWidgets('Find TitleImageBottomModalWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: TitleImageBottomModalWidget(
        key: testKey,
        isBold: isBold,
        title: title,
        titleBold: titleBold,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure TitleImageBottomModalWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: TitleImageBottomModalWidget(
        key: testKey,
        isBold: isBold,
        title: title,
        titleBold: titleBold,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('text_title_image_bottom_modal')), findsOneWidget);
      if (!isBold)
        expect(
            find.text(
                'Are you sure you assign \n this partner as administrator?'),
            findsOneWidget);
    });
  });
}
