import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_name_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/register_name_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_bloc/form_bloc.dart' as form_bloc;

import '../../../../base_tester.dart';

// class MockRegisterName extends MockBloc<form_bloc.FormBlocState<String, String>>
//     implements ProfileNameBloc {}

void main() {
  // ProfileNameBloc mockRegisterName;

  // setUp(() {
  //   mockRegisterName = MockRegisterName();
  // });

  group('Test Register Name Step', () {
    final RegisterNameStepArgs data =
        RegisterNameStepArgs('male', 'assets/images/man.svg');
    testWidgets('Find RegisterNameStepScreen widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: RegisterNameStepScreen(key: testKey, data: data)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render GenderImage', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterNameStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('Find textField widget', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterNameStepScreen(data: data)));
      var textFields = find.byType(TextFieldBlocBuilder);
      await tester.pumpAndSettle();
      expect(textFields, findsNWidgets(2));
    });

    testWidgets('Render FooterStepWidget', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterNameStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(FooterStepWidget), findsOneWidget);
    });

    testWidgets('Test placeholder texts', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: RegisterNameStepScreen(data: data)));
      await tester.pumpAndSettle();

      expect(find.text('First name'), findsOneWidget);
      expect(find.text('Last name'), findsOneWidget);
    });
  });
}
