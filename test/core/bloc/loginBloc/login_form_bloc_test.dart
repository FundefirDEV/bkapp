import 'dart:convert';

import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:bkapp_flutter/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../base_tester.dart';

class MockLoginRepository extends Mock implements LoginRepository {}
class MockApiprovider extends Mock implements ApiProvider {}

void main() {
  LoginFormBloc formBloc;
  AuthenticationBloc authenticationBloc; // REVIEW test the login state
  LoginRepository mockLoginRepository;
  http.Client mockClient;
  ApiProvider apiProvider;

  var widgetTester = (repository) => baseTester(
      child: BlocProvider(
        create: (context) => formBloc = LoginFormBloc(
          authenticationBloc: authenticationBloc = AuthenticationBloc(
            loginRepository: repository
          ),
          repository: repository
        ),
        child: Builder(
          builder: (context) => LoginScreen(),
      )
    )
  );

  testWidgets('The onSubmitting should be success', (WidgetTester tester) async {
    mockClient = MockClient((request) async {
      final mapJson = {'token':'kaslfjkdsHJHs'};
      return http.Response(json.encode(mapJson), 200);
    });
    apiProvider = ApiProvider(httpClient: mockClient);
    mockLoginRepository = LoginRepository(
      apiProvider: apiProvider
    );

    await tester.pumpWidget(widgetTester(mockLoginRepository));
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
    expect(formBloc.state, isInstanceOf<FormBlocSuccess>());
  });

  testWidgets('The onSubmitting should be failure', (WidgetTester tester) async {
    mockClient = MockClient((request) async {
      final mapJson = {'message':'bad credentials'};
      return http.Response(json.encode(mapJson),401);
    });
    apiProvider = ApiProvider(httpClient: mockClient);
    mockLoginRepository = LoginRepository(
      apiProvider: apiProvider
    );

    await tester.pumpWidget(widgetTester(mockLoginRepository));
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

  tearDown(() {
    formBloc?.close();
    authenticationBloc?.close();
  });
}
