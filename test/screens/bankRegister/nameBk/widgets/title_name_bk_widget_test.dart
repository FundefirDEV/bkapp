import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/title_name_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test render TitleNameBkWidget', () {

    testWidgets('Find TitleNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: TitleNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure TitleNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: TitleNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('title-name-bk')), findsOneWidget);
      expect(find.byKey(Key('text1-name-bk')), findsOneWidget);
      expect(find.byKey(Key('text2-name-bk')), findsOneWidget);
    });
  });
}
