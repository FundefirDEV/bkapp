import 'dart:convert';

import 'package:bkapp_flutter/core/bloc/loginFormBloc/login_form_bloc.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:bkapp_flutter/src/screens/introRegister/intro_register_screen.dart';
import 'package:bkapp_flutter/src/screens/login/login_screen.dart';
import 'package:bkapp_flutter/src/screens/login/widgets/login_form_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../base_tester.dart';

class MockClient extends Mock implements HttpClientAdapter {}

void main() {
  LoginRepository repository = LoginRepository(
    apiProvider: ApiProvider(
      httpClient: new Dio(),
    )
  );

  group('Test LoginScreen', () {
    testWidgets('Find LoginScreen widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => LoginFormBloc(
              repository: repository
            ),
            child: Builder(
              builder: (context) => LoginScreen(key: testKey),
          )
        )
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    testWidgets('Find LoginFormWidget widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => LoginFormBloc(
              repository: repository
            ),
            child: Builder(
              builder: (context) => LoginFormWidget(key: testKey),
            )
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find textField widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => LoginFormBloc(
              repository: repository
            ),
            child: Builder(
              builder: (context) => LoginFormWidget(),
            )
          )
        )
      );
      var textFields = find.byType(TextFieldBlocBuilder);
      await tester.pumpAndSettle();
      expect(textFields, findsNWidgets(2));
    });

    testWidgets('Enter text into TextField', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => LoginFormBloc(
              repository: repository
            ),
            child: Builder(
              builder: (context) => LoginFormWidget(),
            )
          )
        )
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(Key('input-username')),
        'Nuevo Usuario'
      );

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('Nuevo Usuario'), findsOneWidget);
    });

    testWidgets('Press button and test hint erros', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => LoginFormBloc(
              repository: repository
            ),
            child: Builder(
              builder: (context) => LoginFormWidget(),
            )
          )
        )
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('raisedButton-accept')));
      await tester.pump();
      expect(find.text('This field is required'), findsNWidgets(2));
      await tester.enterText(
        find.byKey(Key('input-username')),
        'Nuevo Usuario'
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('This field is required'), findsNWidgets(1));
    });

    testWidgets('Change screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => LoginFormBloc(
              repository: repository
            ),
            child: Builder(
              builder: (context) => LoginFormWidget(),
            )
          )
        )
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('flatButton-cancel')));
      await tester.pumpAndSettle();
      expect(find.byType(IntroRegisterScreen), findsOneWidget);
    });

    test('Test post request should return the token', () async {
      final Dio tdio = Dio();
      final mockClient = MockClient();
      tdio.httpClientAdapter = mockClient;
      final ApiProvider tapi = ApiProvider.test(httpClient: tdio);

      final responsepayload = jsonEncode({"response_code": "200"});
      final httpResponse = ResponseBody.fromString(
        responsepayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(mockClient.fetch(any, any, any))
        .thenAnswer((_) async => httpResponse);

      final response = await tapi.getTokenLogin("test@gmail.com", "xxxxx");
      final expected = {"response_code": "200"};

      expect(response, equals(expected));
    });
  });
}
