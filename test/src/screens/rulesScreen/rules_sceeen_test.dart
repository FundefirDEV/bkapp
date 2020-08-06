import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/rules/rules_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../base_tester.dart';

void main() {
  group('Rules screen', () {
    testWidgets('Find rules screen', (WidgetTester tester) async {
      final scaffolsKey = Key('scaffold_rules_screen');
      final topMainContainerKey = Key('top_main_container_rules_screen');
      final bottomMainContainerKey = Key('bottom_main_container_rules_screen');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(scaffolsKey), findsOneWidget);
      expect(find.byKey(topMainContainerKey), findsOneWidget);
      expect(find.byKey(bottomMainContainerKey), findsOneWidget);
    });

    testWidgets('Find top container rules screen', (WidgetTester tester) async {
      final mainContainerKey = Key('top_container_rules_screen');
      final editButtonKey = Key('edit_button_rules_screen');
      final infoContainerKey = Key('top_container_information_rules_Screen');
      final rowKey = Key('row_top_container_rules_Screen');
      final columnKey = Key('text_column_top_container_rules_sreen');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(editButtonKey), findsOneWidget);
      expect(find.byKey(infoContainerKey), findsNWidgets(2));
      expect(find.byKey(rowKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
    });

    testWidgets('Find top container content rules screen',
        (WidgetTester tester) async {
      final containerContentKey = Key('top_container_content_rules_Screen');
      final saloKey = Key('salo_button_container_content_rules_Screen');
      final exitKey = Key('exit_button_container_content_rules_Screen');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(containerContentKey), findsOneWidget);
      expect(find.byKey(saloKey), findsOneWidget);
      expect(find.byKey(exitKey), findsOneWidget);
    });

    testWidgets('Find credit and interest containers',
        (WidgetTester tester) async {
      final mainRowKey =
          Key('main_Row_credit_interest_containers_rules_screen');
      final mainContainerKey = Key('main_credit_container_rules_screen');
      final columnKey = Key('column_credit_container_rules_screen');
      final containerKey = Key('credit_container_rules_screen');
      final rowKey = Key('row_container_rules_screen');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainRowKey), findsOneWidget);
      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(rowKey), findsOneWidget);
    });

    testWidgets('Find credit rules container', (WidgetTester tester) async {
      final creditKey = Key('container-credits-rules');
      final duesKey = Key('container_dues_rules');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(creditKey), findsOneWidget);
      expect(find.byKey(duesKey), findsOneWidget);
    });

    testWidgets('Find interest rules container', (WidgetTester tester) async {
      final mainContainerKey = Key('container_interest_rules');
      final columnKey = Key('column_interest_rules');
      final topContainerKey = Key('top_container_interest_rules');
      final middleContainerKey = Key('middle_container_interest_rules');
      final bottomContainerKey = Key('bottom_container_interest_rules');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(topContainerKey), findsOneWidget);
      expect(find.byKey(middleContainerKey), findsOneWidget);
      expect(find.byKey(bottomContainerKey), findsOneWidget);
    });

    testWidgets('Find payment and shares containers',
        (WidgetTester tester) async {
      final mainRowKey = Key('main_row_payments_shares_container');
      final mainContainerKey = Key('main_container_payments_shares_container');
      final columnKey = Key('column_payment_container_rules_screen');
      final containerKey = Key('payment_container_rules_screen');
      final rowKey = Key('payment_row_rules_screen');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainRowKey), findsOneWidget);
      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(rowKey), findsOneWidget);
    });

    testWidgets('Find payment rules container', (WidgetTester tester) async {
      final paymentKey = Key('container_payments_rules');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(paymentKey), findsOneWidget);
    });

    testWidgets('Find shares rules container', (WidgetTester tester) async {
      final mainContainerKey = Key('container_shares_rules');
      final columnKey = Key('column_shares_rules');
      final topContainerKey = Key('top_container_shares_rules');
      final bottomContainerKey = Key('bottom_container_shares_rules');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(topContainerKey), findsOneWidget);
      expect(find.byKey(bottomContainerKey), findsOneWidget);
    });

    testWidgets('Find funds and reunion containers',
        (WidgetTester tester) async {
      final mainRowKey = Key('main_row_funds_reunion_container');
      final mainContainerKey = Key('main_container_funds_reunion_container');
      final columnKey = Key('column_funds_reunion_screen');
      final containerKey = Key('funds_container_rules_screen');
      final rowKey = Key('funds_row_rules_screen');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainRowKey), findsOneWidget);
      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(rowKey), findsOneWidget);
    });

    testWidgets('Find funds rules container', (WidgetTester tester) async {
      final creditKey = Key('container-fund-rules');
      final duesKey = Key('container-incobrable-rules');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(creditKey), findsOneWidget);
      expect(find.byKey(duesKey), findsOneWidget);
    });

    testWidgets('Find reunion rules container', (WidgetTester tester) async {
      final mainContainerKey = Key('container_reunion_rules');
      final columnKey = Key('column_reunion_rules');
      final topContainerKey = Key('top_container_reunion_rules');
      final middleContainerKey = Key('middle_container_reunion_rules');
      final bottomContainerKey = Key('bottom_container_reunion_rules');

      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: RulesScreen())));
      await tester.pumpAndSettle();

      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(topContainerKey), findsOneWidget);
      expect(find.byKey(middleContainerKey), findsOneWidget);
      expect(find.byKey(bottomContainerKey), findsOneWidget);
    });
  });
}
