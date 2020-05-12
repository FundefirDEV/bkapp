import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../base_tester.dart';

void main() {
  group('Test invite modal', () {
    testWidgets('Find invite modal', (WidgetTester tester) async {
      final keyFilter = Key('filter_invite_modal');
      final keyDialog = Key('dialog_invite_modal');
      final keyColumn = Key('column_invite_modal');
      final keyClose = Key('close_container_invite_modal');


      await tester.pumpWidget(baseTester(child: InviteModal()));
      await tester.pumpAndSettle();

      expect(find.byKey(keyFilter), findsOneWidget);
      expect(find.byKey(keyDialog), findsOneWidget);
      expect(find.byKey(keyColumn), findsOneWidget);
      expect(find.byKey(keyClose), findsOneWidget);

    });

    testWidgets('Find content in invite modal', (WidgetTester tester) async {
  
      final keyClose = Key('close_container_invite_modal');
      final keyTitle = Key('title_container_invite_modal');
      final keyContact = Key('contact_nutton_invite_modal');


      await tester.pumpWidget(baseTester(child: InviteModal()));
      await tester.pumpAndSettle();

      expect(find.byKey(keyClose), findsOneWidget);
      expect(find.byKey(keyTitle), findsOneWidget);
      expect(find.byKey(keyContact), findsOneWidget);


    });

    testWidgets('Enter text into TextField invite modal',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: InviteModal()));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(Key('input_name_invite_modal')), 'Nombre');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('Nombre'), findsOneWidget);
    });

    testWidgets('Press button and test hint errors invite modal',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: InviteModal()));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('raisedButton-accept')));
      await tester.pump();
      expect(find.text('This field is required'), findsNWidgets(2));
      await tester.enterText(
          find.byKey(Key('input_name_invite_modal')), 'Nombre');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('This field is required'), findsOneWidget);
    });

    testWidgets('Press button and test hint errors invite modal',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: InviteModal()));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('raisedButton-accept')));
      await tester.pump();
      expect(find.text('This field is required'), findsNWidgets(2));
      await tester.enterText(
          find.byKey(Key('input_name_invite_modal')), 'Nombre');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('This field is required'), findsOneWidget);
    });
  });
}
