import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

Widget myTester({Widget child}) {
  final i18n = I18n.delegate;
  return MaterialApp(
    localizationsDelegates: [
      i18n,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    home: child,
  );
}

void main() {
  group('Test Bottom Modal', () {
    testWidgets('Find Bottom modal', (WidgetTester tester) async {
      final key = Key('container_bottom_modal');
      await tester.pumpWidget(myTester(child: BottomModal()));
      await tester.pumpAndSettle();

      expect(find.byKey(key), findsNWidgets(1));
    });
  });
}
