import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_email_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_bloc/form_bloc.dart' as form_bloc;

import '../../../../base_tester.dart';

class MockRegisterEmail extends MockBloc<
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
  });
}
