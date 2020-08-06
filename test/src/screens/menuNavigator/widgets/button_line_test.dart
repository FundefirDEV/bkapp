import 'package:bkapp_flutter/src/screens/menuNavigator/widgets/menuAnimated/button_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  testWidgets('Test ButtonLine exists', (WidgetTester tester) async {
    final keyButton = Key('key-button');
    await tester
      .pumpWidget(baseTester(child: ButtonLine(
        key: keyButton,
        onPressed: () {},
        text: 'Button',
      )));
    await tester.pumpAndSettle();

    expect(find.byKey(keyButton), findsOneWidget);
  });
}
