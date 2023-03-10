import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_phone_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_bloc/form_bloc.dart' as form_bloc;

import '../../../../base_tester.dart';

// class MockRegisterPhone
//     extends MockBloc<form_bloc.FormBlocState<String, String>>
//     implements ProfilePhoneBloc {}

void main() {
  // ProfilePhoneBloc mockRegisterPhone;

  // setUp(() {
  //   mockRegisterPhone = MockRegisterPhone();
  // });

  group('Test Register Phone Step', () {
    final RegisterPhoneStepArgs data =
        RegisterPhoneStepArgs('male', 'assets/images/man.svg');
    testWidgets('Find RegisterPhoneStepScreen widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: RegisterPhoneStepScreen(key: testKey, data: data)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render GenderImage', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('Find textField widget', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      var textFields = find.byType(TextFieldBlocBuilder);
      await tester.pumpAndSettle();
      expect(textFields, findsOneWidget);
    });

    testWidgets('Render FooterStepWidget', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(FooterStepWidget), findsOneWidget);
    });

    testWidgets('Other push buttonNextStep', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('buttonNextStep')), findsNothing);
    });

    testWidgets('Open Modal Country', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      await tester.pumpAndSettle();

      expect(
          find.byKey(Key('inkell-register-phone-container')), findsOneWidget);
      await tester.tap(find.byKey(Key('inkell-register-phone-container')));
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(InkWell), findsNWidgets(2));
    });

    testWidgets('Testing phone formatter', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(Key('phone-input-field')), '3023901035');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('(302) 390-1035'), findsOneWidget);
    });

    testWidgets('Testing error greater than 9', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterPhoneStepScreen(data: data)));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('phone-input-field')), '302390');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('The number should be greater than 9'), findsOneWidget);
    });
  });
}
