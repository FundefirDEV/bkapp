import 'package:bkapp_flutter/src/screens/profile/profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profileEdit/profile_edit_screen.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../base_tester.dart';

void main() {
  group('Profile screen', () {
    testWidgets('Top container profile screen', (WidgetTester tester) async {
      final scaffolsKey = Key('Scaffold_profile_screen');
      final topContainerKey = Key('Top_container_profile_Screen');
      final topContainerInformationKey =
          Key('Top_container_information_profile_Screen');
      final profilePictureKey = Key('Profile_picture');
      final saloButtonKey = Key('Salo_button_container_profile_Screen');
      final exitButtonKey = Key('Exit_button_container_profile_Screen');
      final rowTopContainerKey = Key('row_top_container_profile_Screen');
      final rowTextTopContainerKey =
          Key('Text_column_top_container_profile_sreen');
      final editButtonKey = Key('Edit_button_profile_screen');

      await tester.pumpWidget(baseTester(child: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(scaffolsKey), findsOneWidget);
      expect(find.byKey(profilePictureKey), findsOneWidget);
      expect(find.byKey(saloButtonKey), findsOneWidget);
      expect(find.byKey(exitButtonKey), findsOneWidget);
      expect(find.byKey(rowTextTopContainerKey), findsOneWidget);
      expect(find.byKey(editButtonKey), findsOneWidget);
      expect(find.byKey(topContainerKey), findsNWidgets(2));
      expect(find.byKey(topContainerInformationKey), findsNWidgets(2));
      expect(find.byKey(rowTopContainerKey), findsOneWidget);
    });
    testWidgets('Middle container profile screen', (WidgetTester tester) async {
      final rowKey = Key('Row_middle_containers_profile_screen');
      final idKey = Key('Id_container_profile_screen');
      final profileImageKey = Key('Middle_container_profile_image');
      final identificationKey = Key('Identification_container_profile_screen');
      final birthDateKey = Key('BirthDate_container_profile_screen');
      final scholarshipKey = Key('Scholarship_container_profile_screen');
      final collageImageKey = Key('Collage_image_container_profile_screen');
      final professionKey = Key('Profession_container_profile_screen');

      await tester.pumpWidget(baseTester(child: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(rowKey), findsOneWidget);
      expect(find.byKey(idKey), findsOneWidget);
      expect(find.byKey(profileImageKey), findsOneWidget);
      expect(find.byKey(identificationKey), findsOneWidget);
      expect(find.byKey(birthDateKey), findsOneWidget);
      expect(find.byKey(collageImageKey), findsOneWidget);
      expect(find.byKey(professionKey), findsOneWidget);
      expect(find.byKey(scholarshipKey), findsNWidgets(2));
    });
    testWidgets('Gain button profile screen', (WidgetTester tester) async {
      final containerKey = Key('Container_gain_button_profile_screen');
      final flatButtonKey = Key('Flat_button_gain_button_profile_screen');
      final internalContainerKey =
          Key('Internal_container_gain_button_profile_screen');

      await tester.pumpWidget(baseTester(child: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(flatButtonKey), findsOneWidget);
      expect(find.byKey(internalContainerKey), findsOneWidget);
    });

    testWidgets('Bottom container profile screen', (WidgetTester tester) async {
      final creditsKey = Key('Credits_bottom_container_profile_screen');
      final actionsKey = Key('Actions_bottom_container_profile_screen');
      final ritchText = Key('RichText_bottom_container_profile_screen');
          Key('Internal_container_gain_button_profile_screen');
      Key('Internal_container_gain_button_profile_screen');

      await tester.pumpWidget(baseTester(child: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(creditsKey), findsOneWidget);
      expect(find.byKey(actionsKey), findsOneWidget);
      expect(find.byKey(ritchText), findsNWidgets(2));
    });

    testWidgets('Test title widgets', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(TitleHeaderWidget), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('Test edit button pressed', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('Edit_button_profile_screen')), findsOneWidget);
      await tester.tap(find.byKey(Key('Edit_button_profile_screen')));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileEditScreen), findsOneWidget);
    });
  });
}
