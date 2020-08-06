import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_pin_code_verification_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/pin_code_form_listener_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:form_bloc/form_bloc.dart' as form_bloc;

import '../../../../base_tester.dart';

class MockRegisterPhone extends MockBloc<
        form_bloc.FormBlocState<String, String>>
    implements ProfilePinCodeVerificationBloc {}

void main() {
  ProfilePinCodeVerificationBloc mockRegisterPinCode;

  setUp(() {
    mockRegisterPinCode = MockRegisterPhone();
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

    testWidgets('Change RegisterNameFormListener, next widget onSucces',
        (WidgetTester tester) async {
      var expectedStates = [
        FormBlocLoading<String, String>(
            isEditing: true, isValidByStep: null, progress: 100.0),
        FormBlocLoaded<String, String>(null, isEditing: true),
        FormBlocSuccess<String, String>(
            isValidByStep: null, successResponse: 'success')
      ];

      whenListen(mockRegisterPinCode, Stream.fromIterable(expectedStates));
      when(mockRegisterPinCode.state).thenReturn(expectedStates.last);

      RegisterPinCodeScreenStepArgs data =
          RegisterPinCodeScreenStepArgs('hola', 'assets/images/check.jpg');
      await tester.pumpWidget(baseTester(
          child: BlocProvider.value(
              value: mockRegisterPinCode,
              child: PinCodeFormListenerWidget(data: data))));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterPasswordStepScreen), findsOneWidget);
    });
  });
}
