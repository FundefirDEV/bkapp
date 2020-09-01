import 'package:bkapp_flutter/core/bloc/administratorAsignmentBloc/administrator_asignment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/administratorAssignment/widgets/switchAdmin/switch_admin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

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

  group('Test SwitchAdmin', () {
    final testKey = Key('my-id');
    bool isAdmin = true;
    String partnerName = 'pepe';

    testWidgets('Find SwitchAdmin', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: SwitchAdmin(
        key: testKey,
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
    }, skip: true);

    testWidgets('Switch can toggle to true', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: administratorAssignmentScreen(
        testKey,
      )));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('switch_admin_0')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('switch_admin_0')), findsOneWidget);
    }, skip: true);

    testWidgets('Find widgets structure SwitchAdmin',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: SwitchAdmin(
        key: testKey,
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
