import 'package:bkapp_flutter/src/screens/menuNavigator/widgets/menuAnimated/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  testWidgets('Test FloatingButton exists', (WidgetTester tester) async {
    final keyButton = Key('key-button');
    await tester
      .pumpWidget(baseTester(child: FloatingButton(
        key: keyButton,
        onPressed: () {},
        controller: AnimationController(vsync: TestVSync()),
      )));
    await tester.pumpAndSettle();

    expect(find.byKey(keyButton), findsOneWidget);
  });

  testWidgets('Test structure in the widget', (WidgetTester tester) async {
    await tester
      .pumpWidget(baseTester(child: FloatingButton(
        onPressed: () {},
        controller: AnimationController(vsync: TestVSync()),
      )));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('floating-container')), findsOneWidget);
    expect(find.byType(FittedBox), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
