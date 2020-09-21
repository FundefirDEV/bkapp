import 'package:bkapp_flutter/src/screens/profileEdit/profile_edit_screen.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Profile screen', () {
    testWidgets('Find profile edit screen', (WidgetTester tester) async {
      final scaffolsKey = Key('Scaffold_profile_edit_screen');
      final mainColumnKey = Key('Main_column_profile_edit_screen');

      await tester.pumpWidget(baseTester(child: ProfileEditScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(scaffolsKey), findsOneWidget);
      expect(find.byKey(mainColumnKey), findsOneWidget);
    });
    testWidgets('Find top container profile edit screen',
        (WidgetTester tester) async {
      final topContainerKey = Key('Top_container_profile_edit_Screen');
      final topContainerColumnKey =
          Key('Top_container_column_profile_edit_Screen');
      final topContainerinfoKey = Key('Top_container_info_profile_edit_Screen');

      await tester.pumpWidget(baseTester(child: ProfileEditScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(topContainerKey), findsOneWidget);
      expect(find.byKey(topContainerColumnKey), findsOneWidget);
      expect(find.byKey(topContainerinfoKey), findsOneWidget);
    });
    testWidgets('Find textFields profile edit screen',
        (WidgetTester tester) async {
      final textFieldContainerKey =
          Key('Container_textFields_profile_edit_screen');
      final scrollViewKey = Key('ScrollView_profile_edit_screen');
      final columnTextFieldKey = Key('Column_textFields_profile_edit_screen');
      final rowTextField = Key('Row_textFields_profile_edit_screen');
      final scholarshipKey = Key('scholarship_textFields_profile_edit_screen');
      final professionKey = Key('profession_textFields_profile_edit_screen');
      final idKey = Key('id_textFields_profile_edit_screen');
      final birthDateKey = Key('birthDate_textFields_profile_edit_screen');
      final lastNameKey = Key('LastName_textFields_profile_edit_screen');
      final emailKey = Key('Email_textFields_profile_edit_screen');
      final nameKey = Key('name_textFields_profile_edit_screen');
      final cellphoneKey = Key('cellphone_textFields_profile_edit_screen');

      await tester.pumpWidget(baseTester(child: ProfileEditScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(textFieldContainerKey), findsOneWidget);
      expect(find.byKey(scrollViewKey), findsOneWidget);
      expect(find.byKey(columnTextFieldKey), findsOneWidget);
      expect(find.byKey(scholarshipKey), findsOneWidget);
      expect(find.byKey(professionKey), findsOneWidget);
      expect(find.byKey(idKey), findsOneWidget);
      expect(find.byKey(birthDateKey), findsOneWidget);
      expect(find.byKey(lastNameKey), findsOneWidget);
      expect(find.byKey(emailKey), findsOneWidget);
      expect(find.byKey(nameKey), findsOneWidget);
      expect(find.byKey(cellphoneKey), findsOneWidget);
      expect(find.byKey(rowTextField), findsNWidgets(4));
    });
    testWidgets('Find update button profile edit screen',
        (WidgetTester tester) async {
      final containerKey = Key('Container_update_button_profile_edit_screen');
      final flatButtonKey = Key('flatButton_profile_edit_screen');

      await tester.pumpWidget(baseTester(child: ProfileEditScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(flatButtonKey), findsOneWidget);
    });

    testWidgets('Test title widgets', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: ProfileEditScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsNWidgets(2));
    });
  });
}
