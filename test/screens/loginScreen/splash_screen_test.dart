import 'package:bkapp_flutter/src/screens/login/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {

  testWidgets('Test structure', (WidgetTester tester) async {
    final splashKey = Key('splash-key');
    await tester.pumpWidget(baseTester(
      child: SplashPage(key: splashKey)
    ));
    await tester.pump();

    expect(find.byKey(splashKey), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}

