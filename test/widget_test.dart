import 'package:bkapp_flutter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Find a text widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    final titleFinder = find.text('Hola Mundo');
    expect(titleFinder, findsOneWidget);
  });
}
