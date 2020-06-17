import 'dart:convert';

import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:bkapp_flutter/src/screens/login/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../base_tester.dart';

class MockClient extends Mock implements HttpClientAdapter {}
void main() {

  LoginFormBloc formBloc;
  AuthenticationBloc authenticationBloc; // REVIEW test the login state

  final Dio tdio = Dio();
  final mockClient = MockClient();
  tdio.httpClientAdapter = mockClient;
  final LoginRepository tapi = LoginRepository.test(
    apiProvider: ApiProvider(httpClient: tdio)
  );

  var widgetTester = baseTester(
      child: BlocProvider(
        create: (context) => formBloc = LoginFormBloc(
          authenticationBloc: authenticationBloc = AuthenticationBloc(
            loginRepository: tapi
          ),
          repository: tapi
        ),
        child: Builder(
          builder: (context) => LoginScreen(),
      )
    )
  );

  testWidgets('The onSubmitting should fail', (WidgetTester tester) async {
    await tester.pumpWidget(widgetTester);
    await tester.pumpAndSettle();

    // NOTE username
    await tester.enterText(
      find.byKey(Key('input-username')),
      'email@gmail.com'
    );

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // NOTE password
    await tester.enterText(
      find.byKey(Key('input-password')),
      'xxxx'
    );

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    formBloc.onSubmitting();
    await tester.pumpAndSettle(Duration(seconds: 3));
    expect(formBloc.state, isInstanceOf<FormBlocFailure>());
  });


  test('The onSubmitting should works', () async {
    formBloc = LoginFormBloc(
      authenticationBloc: authenticationBloc = AuthenticationBloc(
        loginRepository: tapi
      ),
      repository: tapi
    );

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

    await tapi.postLogin(
      username: "test@gmail.com",
      password: "xxxxx"
    );

    formBloc.onSubmitting();
    expect(authenticationBloc.state, isA<AuthenticationUninitialized>());
    expect(formBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    formBloc?.close();
    authenticationBloc?.close();
  });
}
