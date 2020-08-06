import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  AuthenticationBloc authenticationBloc;
  LoginRepository loginRepository;

  setUp(() {
    loginRepository = MockLoginRepository();
    authenticationBloc = AuthenticationBloc(
      loginRepository: loginRepository
    );
  });

  tearDown(() {
    authenticationBloc?.close();
  });

  final Map<String, dynamic> token = {
    'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
    'expiration': 15671231232
  };

  group('Test LoginBloc and AuthenticationBloc', () {

    test('initial state is correct', () {
      expect(authenticationBloc.state, AuthenticationUninitialized());
    });

    test('test login props', () {
      expect(LoggedIn(token: token).props, [token]);
    });

    test('test login props like string', () {
      expect(LoggedIn(token: token).toString(), 'LoggedIn { token: $token }');
    });

    test('Assert authentication should return an assertion error', () {
      expect(() =>
        AuthenticationBloc(
          loginRepository: null
        ),
        throwsA(isA<AssertionError>())
      );
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Test when the app is initialized from scratch',
      build: () => AuthenticationBloc(
          loginRepository: loginRepository
      ),
      act: (bloc) async {
        bloc.add(AppStarted());
        await Future.delayed(Duration(milliseconds: 10));
      },
      expect: [AuthenticationUnauthenticated()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Test when the user is authenticated',
      build: () => AuthenticationBloc(
          loginRepository: loginRepository
        ),
      act: (bloc) => bloc.add(LoggedIn(
        token: token
      )),
      expect: [
        AuthenticationLoading(),
        AuthenticationAuthenticated()
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Test when the user loggedOut from the app',
      build: () => AuthenticationBloc(
          loginRepository: loginRepository
        ),
      act: (bloc) => bloc.add(LoggedOut()),
      expect: [
        AuthenticationLoading(),
        AuthenticationUnauthenticated()
      ],
    );
  });
}
