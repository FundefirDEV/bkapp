import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_email_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/widgets/register_email_form_listener_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../base_tester.dart';
import 'package:form_bloc/form_bloc.dart' as form_bloc;

class MockRegisterEmail extends MockBloc<form_bloc.FormBlocEvent,
    form_bloc.FormBlocState<String, String>> implements ProfileEmailBloc {}

void main() {
  ProfileEmailBloc mockRegisterEmail;

  setUp(() {
    mockRegisterEmail = MockRegisterEmail();
  });
  group('Test Register Email Step', () {
    final RegisterEmailStepArgs data =
        RegisterEmailStepArgs('male', 'assets/images/man.svg');
    testWidgets('Find RegisterEmailStepScreen widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: RegisterEmailStepScreen(key: testKey, data: data)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render GenderImage', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterEmailStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('Find textField widget', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterEmailStepScreen(data: data)));
      var textFields = find.byType(TextFieldBlocBuilder);
      await tester.pumpAndSettle();
      expect(textFields, findsOneWidget);
    });

    testWidgets('Render FooterStepWidget', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterEmailStepScreen(data: data)));
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

      whenListen(mockRegisterEmail, Stream.fromIterable(expectedStates));
      when(mockRegisterEmail.state).thenReturn(expectedStates.last);

      RegisterEmailStepArgs data =
          RegisterEmailStepArgs('hola', 'assets/images/check.jpg');
      await tester.pumpWidget(baseTester(
          child: BlocProvider.value(
              value: mockRegisterEmail,
              child: RegisterEmailFormListenerWidget(data: data))));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterPhoneStepScreen), findsOneWidget);
    });
  });
}
