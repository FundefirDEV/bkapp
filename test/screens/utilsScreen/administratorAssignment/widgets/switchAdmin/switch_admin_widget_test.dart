import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/utils/administratorAssignment/administrator_assignment_screen.dart';
import 'package:bkapp_flutter/src/screens/utils/administratorAssignment/widgets/switchAdmin/switch_admin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test SwitchAdmin', () {
    Widget administratorAssignmentScreen(Key key) {
      return BlocProvider(
          create: (context) => MenuNavigatorBloc(controller: PageController()),
          child: AdministratorAssignmentScreen(key: key));
    }

    final testKey = Key('my-id');
    Function callback;
    bool isAdmin = true;
    String partnerName = 'pepe';

    testWidgets('Find SwitchAdmin', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: SwitchAdmin(
        key: testKey,
        callback: callback,
        isAdmin: isAdmin,
        partnerName: partnerName,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Switch can toggle to false', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('switch_admin_1')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('switch_admin_1')), findsOneWidget);
    });

    testWidgets('Switch can toggle to true', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('switch_admin_0')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('switch_admin_0')), findsOneWidget);
    });

    testWidgets('Find widgets structure SwitchAdmin',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: SwitchAdmin(
        key: testKey,
        callback: callback,
        isAdmin: isAdmin,
        partnerName: partnerName,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('row_switch_admin')), findsOneWidget);
      expect(find.byKey(Key('container_switch_admin')), findsOneWidget);
      expect(find.byKey(Key('material_switch_admin')), findsOneWidget);
      expect(find.byKey(Key('text_container_switch_admin')), findsOneWidget);
      expect(find.byKey(Key('text_switch_admin')), findsOneWidget);
    });
  });
}
