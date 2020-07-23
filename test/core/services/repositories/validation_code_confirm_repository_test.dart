import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_pin_code_verification_bloc.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/validation_code_confirm_repository.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../base_tester.dart';

class MockClient extends Mock implements HttpClientAdapter {}

void main() {
  ProfilePinCodeVerificationBloc pinCodeBloc;
  final RegisterPinCodeScreenStepArgs data =
        RegisterPinCodeScreenStepArgs('male', 'assets/images/man.svg');

  final Dio tdio = Dio();
  final mockClient = MockClient();
  tdio.httpClientAdapter = mockClient;
  final ValidationCodeConfirmRepository tapi = ValidationCodeConfirmRepository.test(
    apiProvider: ApiProvider(httpClient: tdio)
  );

  setUp(() {
    pinCodeBloc = ProfilePinCodeVerificationBloc(
      repository: tapi
    );
  });

  test(
    'Assert ValidationCodeConfirm should return an assertion error',
    () {
    expect(() =>
      ValidationCodeConfirmRepository(
        apiProvider: null
      ),
      throwsA(isA<AssertionError>())
    );
  });

  testWidgets('Test onSubmitting eventListener',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseTester(
        child: PinCodeStepScreen(data: data)
      )
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), '12345');
    await tester.pumpAndSettle(Duration(seconds: 1));

    pinCodeBloc.onSubmitting();
    await tester.pumpAndSettle(Duration(seconds: 3));
    expect(pinCodeBloc.state, isInstanceOf<FormBlocLoaded>());
  });
}
