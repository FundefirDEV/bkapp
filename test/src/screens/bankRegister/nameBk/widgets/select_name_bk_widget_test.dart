import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/name_bk_form_widget.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/widgets/select_name_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test render SelectNameBkWidget', () {

    testWidgets('Find SelectNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find NameBkFormWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: NameBkFormWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure SelectNameBkWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: SelectNameBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('container-label-namebk')), findsOneWidget);
      expect(find.byKey(Key('text-name-bk')), findsOneWidget);
    });
  });
}
