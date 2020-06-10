import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  LoginRepository repository = LoginRepository(
    apiProvider: ApiProvider(
      httpClient: new Dio(),
    )
  );

  final Map<String, dynamic> token = {
    'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
    'expiration': 15671231232
  };

  group('Test LoginBloc and AuthenticationBloc', () {

    blocTest(
      'Test when the app is initialized from scratch',
      build: () async => AuthenticationBloc(
          loginRepository: repository
      ),
      act: (bloc) async {
        bloc.add(AppStarted());
        await Future.delayed(Duration(milliseconds: 10));
      },
      expect: [AuthenticationUnauthenticated()],
    );

    blocTest(
      'Test when the user is authenticated',
      build: () async => AuthenticationBloc(
          loginRepository: repository
        ),
      act: (bloc) async => bloc.add(LoggedIn(
        token: token
      )),
      expect: [
        AuthenticationLoading(),
        AuthenticationAuthenticated()
      ],
    );

    blocTest(
      'Test when the user loggedOut from the app',
      build: () async => AuthenticationBloc(
          loginRepository: repository
        ),
      act: (bloc) async => bloc.add(LoggedOut()),
      expect: [
        AuthenticationLoading(),
        AuthenticationUnauthenticated()
      ],
    );
  });
}
