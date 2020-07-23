import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_pin_code_verification_bloc.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/validation_code_confirm_repository.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../base_tester.dart';

class MockClient extends Mock implements HttpClientAdapter {}

class MockPinBloc extends Mock implements ProfilePinCodeVerificationBloc {}

void main() {
  ProfilePinCodeVerificationBloc pinCodeBloc;
  MockPinBloc mockPinBloc;

  final Dio tdio = Dio();
  final mockClient = MockClient();
  tdio.httpClientAdapter = mockClient;
  final ValidationCodeConfirmRepository tapi =
      ValidationCodeConfirmRepository.test(
          apiProvider: ApiProvider(httpClient: tdio));

  setUp(() {
    pinCodeBloc = ProfilePinCodeVerificationBloc(repository: tapi);
    mockPinBloc = MockPinBloc();
  });

  group('Test PinCodeStepScreen  screen', () {
    final testKey = Key('my-id');
    final RegisterPinCodeScreenStepArgs data =
        RegisterPinCodeScreenStepArgs('male', 'assets/images/man.svg');
    testWidgets('Render PinCodeStepScreen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render ButtonBackWidget widget in PinCodeStepScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      expect(find.byType(ButtonBackWidget), findsOneWidget);
    });

    testWidgets('Render UserDataHeaderInformation widget in PinCodeStepScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      expect(find.byType(UserDataHeaderInformation), findsOneWidget);
    });

    testWidgets('Render FooterStepWidget widget in PinCodeStepScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      expect(find.byType(FooterStepWidget), findsOneWidget);
    });

    testWidgets('Other push to RegisterPhoneStepScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('buttonNextStep')), findsOneWidget);
      await tester.tap(find.byKey(Key('buttonNextStep')));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterPasswordStepScreen), findsOneWidget);
    });

    testWidgets('PinCodeStepScreen render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('column-pin-code-verification')), findsOneWidget);
      expect(find.byKey(Key('expanded-content-pin-code-verification')),
          findsOneWidget);
      expect(find.byKey(Key('expanded-footer-pin-code-verification')),
          findsOneWidget);
    });

    testWidgets('Test enter text into pinCode', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: PinCodeStepScreen(
        key: testKey,
        data: data,
      )));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '12345');
      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.text('12345'), findsOneWidget);
    });
  });
}
