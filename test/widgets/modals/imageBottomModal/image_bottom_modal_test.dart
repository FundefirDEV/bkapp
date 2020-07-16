import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/widgets/button_image_botton_modal_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/widgets/title_image_bottom_modal_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test ImageBottomModal', () {
    final testKey = Key('my-id');
    double modalHeight = 50.0;
    String title = 'Test';
    String titleBold = 'Test';
    bool isBold = true;
    bool isBtnAccept = true;
    bool isImageBg = true;
    String titleAcceptButton = 'Test';
    String titleCloseButton = 'Test';
    String image = 'assets/images/confetti_2.svg';
    Function onPressAccept = () => {};
    Function onPressCancel = () => {};
    testWidgets('Find ImageBottomModal', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ImageBottomModal(
              key: testKey,
              image: image,
              isBold: isBold,
              isBtnAccept: isBtnAccept,
              isImageBg: isImageBg,
              modalHeight: modalHeight,
              title: title,
              titleAcceptButton: titleAcceptButton,
              titleBold: titleBold,
              titleCloseButton: titleCloseButton,
              onPressAccept: onPressAccept,
              onPressCancel: onPressCancel)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find BottomModal widget', (WidgetTester tester) async {
      double width = 5.0;
      double heigth = 5.0;
      Widget child;
      await tester.pumpWidget(baseTester(
          child: BottomModal(
        key: testKey,
        child: child,
        height: heigth,
        width: width,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find TitleImageBottomModalWidget widget',
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

    testWidgets('Find ButtonImageBottonModalWidget widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ButtonImageBottonModalWidget(
        key: testKey,
        isBtnAcept: isBtnAccept,
        titleAcceptButton: titleAcceptButton,
        titleCloseButton: titleCloseButton,
        onPressAccept: onPressAccept,
        onPressCancel: onPressCancel,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure ImageBottomModal',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ImageBottomModal(
              key: testKey,
              image: image,
              isBold: isBold,
              isBtnAccept: isBtnAccept,
              isImageBg: isImageBg,
              modalHeight: modalHeight,
              title: title,
              titleAcceptButton: titleAcceptButton,
              titleBold: titleBold,
              titleCloseButton: titleCloseButton,
              onPressAccept: onPressAccept,
              onPressCancel: onPressCancel)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('image_bottom_modal')), findsOneWidget);
      expect(find.byKey(Key('container_image_bottom_modal')), findsOneWidget);
      expect(find.byKey(Key('stack_image_bottom_modal')), findsOneWidget);
      expect(find.byKey(Key('column_image_bottom_modal')), findsOneWidget);
    });
  });
}
