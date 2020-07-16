import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/widgets/button_image_botton_modal_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test ButtonImageBottonModalWidget', () {
    final testKey = Key('my-id');
    bool isBtnAccept = true;
    String titleAcceptButton = 'Test';
    String titleCloseButton = 'Test';
    Function onPressAccept = () => {};
    Function onPressCancel = () => {};

    testWidgets('Find ButtonImageBottonModalWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ButtonImageBottonModalWidget(
        key: testKey,
        titleAcceptButton: titleAcceptButton,
        titleCloseButton: titleCloseButton,
        isBtnAcept: isBtnAccept,
        onPressAccept: onPressAccept,
        onPressCancel: onPressCancel,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('close modal btn accept', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ButtonImageBottonModalWidget(
        key: testKey,
        titleAcceptButton: titleAcceptButton,
        titleCloseButton: titleCloseButton,
        isBtnAcept: isBtnAccept,
        onPressAccept: onPressAccept,
        onPressCancel: onPressCancel,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('flat_button_image_botton_modal_accept')),
          findsOneWidget);
      await tester
          .tap(find.byKey(Key('flat_button_image_botton_modal_accept')));
      await tester.pumpAndSettle();
    });

    testWidgets('close modal btn close', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ButtonImageBottonModalWidget(
        key: testKey,
        titleAcceptButton: titleAcceptButton,
        titleCloseButton: titleCloseButton,
        isBtnAcept: isBtnAccept,
        onPressAccept: onPressAccept,
        onPressCancel: onPressCancel,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('flat_button_image_botton_modal_close')),
          findsOneWidget);
      await tester.tap(find.byKey(Key('flat_button_image_botton_modal_close')));
      await tester.pumpAndSettle();
    });

    testWidgets('Find widgets structure ButtonImageBottonModalWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: ButtonImageBottonModalWidget(
        key: testKey,
        titleAcceptButton: titleAcceptButton,
        titleCloseButton: titleCloseButton,
        isBtnAcept: isBtnAccept,
        onPressAccept: onPressAccept,
        onPressCancel: onPressCancel,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('row_image_botton_modal')), findsOneWidget);
      expect(find.byKey(Key('flat_button_image_botton_modal_accept')),
          findsOneWidget);
      expect(find.byKey(Key('text_image_botton_modal_accept')), findsOneWidget);
      expect(find.byKey(Key('flat_button_image_botton_modal_close')),
          findsOneWidget);
      expect(find.byKey(Key('text_image_botton_modal_close')), findsOneWidget);
    });
  });
}
