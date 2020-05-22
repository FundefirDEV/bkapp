import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/footerNameBkWidget/widgets/number_page_namebk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

void main() {
  group('Test render NumberPageNameBkWidget', () {

    testWidgets('Find NumberPageNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NumberPageNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure NumberPageNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NumberPageNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('row-content-image-text-footer')), findsOneWidget);
      expect(find.byKey(Key('footer-name-bk-image-left-container')), findsOneWidget);
      expect(find.byKey(Key('footer-name-bk-text-container')), findsOneWidget);
      expect(find.byKey(Key('number-page-text')), findsOneWidget);
    });
  });
}
