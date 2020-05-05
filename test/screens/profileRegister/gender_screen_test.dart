
import 'package:bkapp_flutter/src/screens/profileRegister/gender_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test gender screen', () {
    testWidgets('GenderScreen exist', (WidgetTester tester) async {
      final key = Key('gender-key');
      await tester.pumpWidget(baseTester(child: GenderScreen(key: key)));
      await tester.pumpAndSettle();
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Test structure', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: GenderScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('main-column-gender-screen')), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(6));
      expect(find.byType(HeaderContent), findsOneWidget);
      expect(find.byKey(Key('main-expanded-gender-screen')), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
    });

    testWidgets('Test texts in HeaderContent', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: GenderScreen()));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is RichText &&
            widget.text.toPlainText() == "Hey, let's create your profile"),
        findsOneWidget,
      );
      expect(find.text('Select your gender'), findsOneWidget);
    });
  });
}
