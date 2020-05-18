import 'package:bkapp_flutter/src/screens/profileRegister/registerName/register_name_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/genderButtons/gender_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test gender action buttons', () {
    testWidgets('Male push to RegisterUserStepsScreen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: GenderButtonsWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('genderImage-male')), findsOneWidget);
      await tester.tap(find.byKey(Key('genderImage-male')));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterNameStepScreen), findsOneWidget);
    });

    testWidgets(
      'Female push to RegisterUserStepsScreen',
      (WidgetTester tester) async {
        await tester.pumpWidget(baseTester(child: GenderButtonsWidget()));
        await tester.pumpAndSettle();

        expect(find.byKey(Key('genderImage-female')), findsOneWidget);
        await tester.tap(find.byKey(Key('genderImage-female')));
        await tester.pumpAndSettle();
        expect(find.byType(RegisterNameStepScreen), findsOneWidget);
      }
    );

    testWidgets(
      'Other push to RegisterUserStepsScreen',
      (WidgetTester tester) async {
        await tester.pumpWidget(baseTester(child: GenderButtonsWidget()));
        await tester.pumpAndSettle();

        expect(find.byKey(Key('genderImage-other')), findsOneWidget);
        await tester.tap(find.byKey(Key('genderImage-other')));
        await tester.pumpAndSettle();
        expect(find.byType(RegisterNameStepScreen), findsOneWidget);
      }
    );
  });
}
