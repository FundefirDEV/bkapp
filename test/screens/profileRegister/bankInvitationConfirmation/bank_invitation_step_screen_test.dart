import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test Bank invitation confirmation Step', () {
    final ConfirmInvitationBankStepArgs data =
        ConfirmInvitationBankStepArgs('male', 'assets/images/man.svg');
    testWidgets('Find RegisterPasswordStepScreen widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: ConfirmInvitationBankStepScreen(key: testKey, data: data)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render GenderImage', (WidgetTester tester) async {
      await tester.pumpWidget(
          baseTester(child: ConfirmInvitationBankStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('Render ButtonNextWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
          baseTester(child: ConfirmInvitationBankStepScreen(data: data)));
      await tester.pumpAndSettle();
      expect(find.byType(ButtonNextWidget), findsOneWidget);
    });

    testWidgets('Other push buttonNextStep', (WidgetTester tester) async {
      await tester.pumpWidget(
          baseTester(child: ConfirmInvitationBankStepScreen(data: data)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('buttonNextStep')), findsOneWidget);
    });
  });
}
