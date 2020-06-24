import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/register_name_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test Register Name Step', () {
    final RegisterNameStepArgs data = RegisterNameStepArgs('male', 'assets/images/man.svg');
    testWidgets('Find RegisterNameStepScreen widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: RegisterNameStepScreen(
              key: testKey,
              data: data)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });
  
    testWidgets('Render GenderImage', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: RegisterNameStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('Find textField widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(child: RegisterNameStepScreen(data: data))
      );
      var textFields = find.byType(TextFieldBlocBuilder);
      await tester.pumpAndSettle();
      expect(textFields, findsNWidgets(2));
    });

    testWidgets('Render FooterStepWidget', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: RegisterNameStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(FooterStepWidget), findsOneWidget);
    });

    testWidgets('Other push to RegisterEmailStepScreen', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: RegisterNameStepScreen(data: data)
        )
      );
      await tester.pumpAndSettle();
      
      expect(find.byKey(Key('buttonNextStep')), findsOneWidget);
      await tester.tap(find.byKey(Key('buttonNextStep')));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterEmailStepScreen), findsOneWidget);
    });

    testWidgets('Test placeholder texts', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: RegisterNameStepScreen(data: data)
        )
      );
      await tester.pumpAndSettle();

      expect(find.text('First name'), findsOneWidget);
      expect(find.text('Last name'), findsOneWidget);
    });
  });
}
