import 'package:bkapp_flutter/src/widgets/modals/bottomModal/register_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test Register Modal', () {
    testWidgets('Find register modal', (WidgetTester tester) async {
      final keyColumn = Key('column_register_modal');
      final keyRow = Key('row_register_modal');
      // final keyButtons1 = Key('register_button1');
      final keyButtons2 = Key('register_button2');

      await tester.pumpWidget(baseTester(child: RegisterModal()));
      await tester.pumpAndSettle();

      expect(find.byKey(keyColumn), findsNWidgets(1));
      expect(find.byKey(keyRow), findsNWidgets(1));
      // expect(find.byKey(keyButtons1), findsOneWidget);
      expect(find.byKey(keyButtons2), findsOneWidget);
    });
  });
}
