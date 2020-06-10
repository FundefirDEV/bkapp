import 'package:bkapp_flutter/src/screens/login/login_indicator_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Test structure', (WidgetTester tester) async {
    final loadingKey = Key('loading-key');
    await tester.pumpWidget(LoadingIndicatorScreen(key: loadingKey));
    await tester.pump();

    expect(find.byKey(loadingKey), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

}
