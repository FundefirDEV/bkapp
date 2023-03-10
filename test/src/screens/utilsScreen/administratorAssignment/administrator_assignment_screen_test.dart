import 'package:bkapp_flutter/core/bloc/administratorAsignmentBloc/administrator_asignment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/administratorAssignment/widgets/switchAdmin/switch_admin_widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  Widget administratorAssignmentScreen(Key key) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => MenuNavigatorBloc(controller: PageController())),
      BlocProvider(
          create: (context) =>
              AdministratorAsignmentBloc(repository: administratorRepository))
    ], child: AdministratorAssignmentScreen(key: key, userName: 'Usuario'));
  }

  group('Test AdministratorAssignmentScreen', () {
    final testKey = Key('my-id');

    testWidgets('Find AdministratorAssignmentScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find AppBarWidget', (WidgetTester tester) async {
      Widget container;
      await tester.pumpWidget(baseTester(
          child: AppBarWidget(
        key: testKey,
        container: container,
        userName: 'Usuario',
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find SwitchAdmin', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: SwitchAdmin(
        key: testKey,
        bloc: '',
        isAdmin: true,
        phone: '3153143220',
        partnerName: 'Javier Reyes',
        token: 'XXXXX',
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure AdministratorAssignmentScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('column_administrator_assignmen_screen')),
          findsOneWidget);
    }, skip: true);

    testWidgets('modal accept works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('switch_admin_1')));
      await tester.pumpAndSettle();

      expect(find.byType(ImageBottomModal), findsOneWidget);
      await tester
          .tap(find.byKey(Key('flat_button_image_botton_modal_accept')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('switch_admin_1')), findsOneWidget);
    }, skip: true);

    testWidgets('modal cancel works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('switch_admin_1')));
      await tester.pumpAndSettle();

      expect(find.byType(ImageBottomModal), findsOneWidget);
      await tester.tap(find.byKey(Key('flat_button_image_botton_modal_close')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('switch_admin_1')), findsOneWidget);
    }, skip: true);
  });
}
