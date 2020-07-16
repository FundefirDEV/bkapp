import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/utils/administratorAssignment/administrator_assignment_screen.dart';
import 'package:bkapp_flutter/src/screens/utils/administratorAssignment/list_partners.dart';
import 'package:bkapp_flutter/src/screens/utils/administratorAssignment/widgets/switchAdmin/switch_admin_widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  Widget administratorAssignmentScreen(Key key) {
    return BlocProvider(
        create: (context) => MenuNavigatorBloc(controller: PageController()),
        child: AdministratorAssignmentScreen(key: key));
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
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find SwitchAdmin', (WidgetTester tester) async {
      Function callback;
      List<ListPartners> listPartners = [
        ListPartners(
            name: 'Daniel Tavera', isAdmin: false, numberDocument: 10167252738),
      ];
      await tester.pumpWidget(baseTester(
          child: SwitchAdmin(
        key: testKey,
        callback: callback,
        isAdmin: listPartners[0].isAdmin,
        partnerName: listPartners[0].name,
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
    });
  });
}
