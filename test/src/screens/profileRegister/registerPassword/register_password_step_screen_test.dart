import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_password_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/widgets/register_password_form_listener.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:form_bloc/form_bloc.dart' as form_bloc;

import '../../../../base_tester.dart';

class MockRegisterPassword extends MockBloc<
    form_bloc.FormBlocState<String, String>> implements ProfilePasswordBloc {}

void main() {
  ProfilePasswordBloc mockRegisterPassword;

  setUp(() {
    mockRegisterPassword = MockRegisterPassword();
  });
  group('Test Register Password Step', () {
    final RegisterPasswordStepArgs data =
        RegisterPasswordStepArgs('male', 'assets/images/man.svg');
    testWidgets('Find RegisterPasswordStepScreen widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: RegisterPasswordStepScreen(key: testKey, data: data)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render GenderImage', (WidgetTester tester) async {
      await tester.pumpWidget(
          baseTester(child: RegisterPasswordStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('Find textField widget', (WidgetTester tester) async {
      await tester.pumpWidget(
          baseTester(child: RegisterPasswordStepScreen(data: data)));
      var textFields = find.byType(TextFieldBlocBuilder);
      await tester.pumpAndSettle();
      expect(textFields, findsNWidgets(2));
    });

    testWidgets('Render FooterStepWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
          baseTester(child: RegisterPasswordStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(FooterStepWidget), findsOneWidget);
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

      whenListen(mockRegisterPassword, Stream.fromIterable(expectedStates));
      when(mockRegisterPassword.state).thenReturn(expectedStates.last);

      RegisterPasswordStepArgs data =
          RegisterPasswordStepArgs('hola', 'assets/images/check.jpg');
      await tester.pumpWidget(baseTester(
          child: BlocProvider.value(
              value: mockRegisterPassword,
              child: RegisterPasswordFormListenerWidget(data: data))));
      await tester.pumpAndSettle();
      expect(find.byType(ConfirmInvitationBankStepScreen), findsOneWidget);
    });
  });
}
