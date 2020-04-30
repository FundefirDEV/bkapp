import 'package:bkapp_flutter/src/screens/introRegister/widgets/title_intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_tester.dart';

void main() {
  group('Test TitleIntro Widget', () {
    
    testWidgets('Find TitleIntro widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: TitleIntro(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find container widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TitleIntro()));
      var container = find.byType(Container);
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });

    testWidgets('Find column widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TitleIntro()));
      var container = find.byType(Column);
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });

    testWidgets('Find text widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TitleIntro()));
      var container = find.byType(RichText);
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(2));
    });

    testWidgets('Find padding widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: TitleIntro()));
      var container = find.byType(Padding);
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(1));
    });
  });
}
