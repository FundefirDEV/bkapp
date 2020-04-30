import 'package:bkapp_flutter/src/screens/introRegister/widgets/footer_intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_tester.dart';

void main() {
  group('Test FooterIntro Widget', () {
    
    testWidgets('Find FooterIntro widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: FooterIntro(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find container widget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: FooterIntro()));
      var container = find.byType(Container);
      await tester.pumpAndSettle();
      expect(container, findsNWidgets(3));
    });
  });
}
