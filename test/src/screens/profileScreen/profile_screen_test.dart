import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/core/bloc/profileBloc/profile_bloc.dart';
import 'package:bkapp_flutter/src/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  final testKey = Key('my-id');
  Widget profileTester(Key key) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => MenuNavigatorBloc(controller: PageController())),
      BlocProvider(
        create: (context) => ProfileBloc(repository: null),
      )
    ], child: ProfileScreen(key: key));
  }

  group('Profile screen', () {
    testWidgets('Find profileScreen ', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(baseTester(
            child: profileTester(
          testKey,
        )));
        await tester.pump();

        expect(find.byKey(testKey), findsOneWidget);
      });
    });
    testWidgets('Top container profile screen', (WidgetTester tester) async {
      final topContainerKey = Key('Top_container_profile_Screen');
      final topContainerInformationKey =
          Key('Top_container_information_profile_Screen');
      final profilePictureKey = Key('Profile_picture');
      final saloButtonKey = Key('Salo_button_container_profile_Screen');
      final exitButtonKey = Key('Exit_button_container_profile_Screen');
      final rowTopContainerKey = Key('row_top_container_profile_Screen');
      final editButtonKey = Key('Edit_button_profile_screen');

      await tester.pumpWidget(baseTester(child: profileTester(testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(profilePictureKey), findsOneWidget);
      expect(find.byKey(saloButtonKey), findsOneWidget);
      expect(find.byKey(exitButtonKey), findsOneWidget);
      expect(find.byKey(editButtonKey), findsOneWidget);
      expect(find.byKey(topContainerKey), findsNWidgets(2));
      expect(find.byKey(topContainerInformationKey), findsNWidgets(2));
      expect(find.byKey(rowTopContainerKey), findsOneWidget);
    }, skip: true);
    testWidgets('Middle container profile screen', (WidgetTester tester) async {
      final rowKey = Key('Row_middle_containers_profile_screen');
      final idKey = Key('Id_container_profile_screen');
      final profileImageKey = Key('Middle_container_profile_image');
      final identificationKey = Key('Identification_container_profile_screen');
      final birthDateKey = Key('BirthDate_container_profile_screen');
      final scholarshipKey = Key('Scholarship_container_profile_screen');
      final collageImageKey = Key('Collage_image_container_profile_screen');
      final professionKey = Key('Profession_container_profile_screen');

      await tester.pumpWidget(baseTester(child: profileTester(testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(rowKey), findsOneWidget);
      expect(find.byKey(idKey), findsOneWidget);
      expect(find.byKey(profileImageKey), findsOneWidget);
      expect(find.byKey(identificationKey), findsOneWidget);
      expect(find.byKey(birthDateKey), findsOneWidget);
      expect(find.byKey(collageImageKey), findsOneWidget);
      expect(find.byKey(professionKey), findsOneWidget);
      expect(find.byKey(scholarshipKey), findsNWidgets(2));
    }, skip: true);
    testWidgets('Gain button profile screen', (WidgetTester tester) async {
      final containerKey = Key('Container_gain_button_profile_screen');
      final flatButtonKey = Key('Flat_button_gain_button_profile_screen');
      final internalContainerKey =
          Key('Internal_container_gain_button_profile_screen');

      await tester.pumpWidget(baseTester(child: profileTester(testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(flatButtonKey), findsOneWidget);
      expect(find.byKey(internalContainerKey), findsOneWidget);
    }, skip: true);

    testWidgets('Bottom container profile screen', (WidgetTester tester) async {
      final creditsKey = Key('Credits_bottom_container_profile_screen');
      final actionsKey = Key('Actions_bottom_container_profile_screen');
      final ritchText = Key('RichText_bottom_container_profile_screen');
      Key('Internal_container_gain_button_profile_screen');
      Key('Internal_container_gain_button_profile_screen');

      await tester.pumpWidget(baseTester(child: profileTester(testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(creditsKey), findsOneWidget);
      expect(find.byKey(actionsKey), findsOneWidget);
      expect(find.byKey(ritchText), findsNWidgets(2));
    }, skip: true);

    testWidgets('Test title widgets', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: profileTester(testKey)));
      await tester.pumpAndSettle();

      expect(find.byType(TitleHeaderWidget), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    }, skip: true);
  });
}
