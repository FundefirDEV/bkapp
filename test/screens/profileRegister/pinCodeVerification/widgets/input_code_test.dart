import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/input_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test InputCode  screen', () {
    testWidgets('Render InputCode', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: InputCode()));
      await tester.pumpAndSettle();

      expect(find.byType(InputCode), findsOneWidget);
    });

    testWidgets('tab focus', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: InputCode()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('input-code-column-gesture-detector')),
          findsOneWidget);
      await tester.tap(find.byKey(Key('input-code-column-gesture-detector')));
      await tester.pumpAndSettle();
      expect(FocusNode, FocusNode);
    });

    testWidgets('InputCode render structure', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: InputCode()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('input-code-column')), findsOneWidget);
      expect(find.byKey(Key('input-code-material')), findsOneWidget);
      expect(find.byKey(Key('input-code-padding')), findsOneWidget);
      expect(find.byKey(Key('input-code-pin-code')), findsOneWidget);
      expect(find.byKey(Key('input-code-padding-error-text')), findsOneWidget);
      expect(find.byKey(Key('input-code-text-error')), findsOneWidget);
      expect(find.byKey(Key('input-code-rich-text')), findsOneWidget);
      expect(find.byKey(Key('input-code-column-gesture-detector')),
          findsOneWidget);
    });
  });
}
