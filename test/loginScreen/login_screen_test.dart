import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/login/login_screen.dart';
import 'package:bkapp_flutter/src/screens/login/widgets/login_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
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
  group('Test LoginScreen Widget', () {
    testWidgets('Find LoginScreen widget', (WidgetTester tester) async {
      final testKey = Key('K');
      await tester.pumpWidget(myTester(child: LoginScreen(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    testWidgets('Find LoginFormWidget widget', (WidgetTester tester) async {
      final testKey = Key('K');
      await tester.pumpWidget(myTester(child: LoginFormWidget(key: testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    test('Username has a value', () {
      TextFieldBloc fieldBloc;
      TextFieldBlocState initialState;

      fieldBloc = TextFieldBloc<dynamic>(
        name: 'email',
        initialValue: 'a',
      );

      initialState = TextFieldBlocState<dynamic>(
        value: 'a',
        error: null,
        isInitial: true,
        suggestions: null,
        isValidated: true,
        isValidating: false,
        name: 'email',
      );

      expect(fieldBloc.initialState, initialState);
      fieldBloc.close();
    });
  });
}
