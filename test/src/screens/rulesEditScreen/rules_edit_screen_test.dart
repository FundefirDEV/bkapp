import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/rulesEdit/rules_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  // group('Rules edit screen', () {
  //   testWidgets('Find rules edit screen', (WidgetTester tester) async {
  //     final scaffolsKey = Key('scaffold_rules_edit_screen');
  //     final mainColumnKey = Key('main_column_rules_edit_screen');
  //     final containerTextFieldKey =
  //         Key('container_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(scaffolsKey), findsOneWidget);
  //     expect(find.byKey(mainColumnKey), findsOneWidget);
  //     expect(find.byKey(containerTextFieldKey), findsOneWidget);
  //   });

  //   testWidgets('Find scroolView content rules edit screen',
  //       (WidgetTester tester) async {
  //     final scrollViewKey = Key('scrollView_rules_edit_screen');
  //     final columnTextFieldKey = Key('column_textFields_rules_edit_screen');

  //     final containerButtonKey =
  //         Key('container_update_button_rules_edit_screen');
  //     final flatButtonKey = Key('flatButton_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(scrollViewKey), findsOneWidget);
  //     expect(find.byKey(columnTextFieldKey), findsOneWidget);
  //     expect(find.byKey(containerButtonKey), findsOneWidget);
  //     expect(find.byKey(flatButtonKey), findsOneWidget);
  //   });

  //   testWidgets('Find textFields rows rules edit screen',
  //       (WidgetTester tester) async {
  //     final rowTextFieldKey = Key('row_textFields_rules_edit_screen');
  //     final middleRowKey = Key('row_middle_textFields_rules_edit_screen');
  //     final bottomRowKey = Key('row_bottom_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(rowTextFieldKey), findsOneWidget);
  //     expect(find.byKey(middleRowKey), findsOneWidget);
  //     expect(find.byKey(bottomRowKey), findsOneWidget);
  //   });
  //   testWidgets('Find top container rules edit screen',
  //       (WidgetTester tester) async {
  //     final containerKey = Key('top_container_rules_edit_Screen');
  //     final columnKey = Key('top_container_column_rules_edit_Screen');
  //     final infoKey = Key('top_container_info_rules_edit_Screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(containerKey), findsOneWidget);
  //     expect(find.byKey(columnKey), findsOneWidget);
  //     expect(find.byKey(infoKey), findsOneWidget);
  //   });
  // });

  // group('textFields rules edit screen', () {
  //   testWidgets('Find shares textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final sharesKey = Key('shares_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(sharesKey), findsOneWidget);
  //   });

  //   testWidgets('Find payment textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final paymentKey = Key('payment_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(paymentKey), findsOneWidget);
  //   });
  //   testWidgets('Find maxCredit textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final maxCreditKey = Key('maxCredit_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(maxCreditKey), findsOneWidget);
  //   });
  //   testWidgets('Find maxDues textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final maxDues = Key('maxDues_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(maxDues), findsOneWidget);
  //   });
  //   testWidgets('Find ordinaryInterest textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final ordinaryKey = Key('ordinaryInterest_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(ordinaryKey), findsOneWidget);
  //   });
  //   testWidgets('Find defaultInterest textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final ordinaryKey = Key('ordinaryInterest_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(ordinaryKey), findsOneWidget);
  //   });
  //   testWidgets('Find fund textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final fundKey = Key('fund_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(fundKey), findsOneWidget);
  //   });
  //   testWidgets('Find incobrable textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final incobrableKey = Key('incobrable_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(incobrableKey), findsOneWidget);
  //   });
  //   testWidgets('Find week textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final weekKey = Key('week_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(weekKey), findsOneWidget);
  //   });
  //   testWidgets('Find day textField rules edit screen',
  //       (WidgetTester tester) async {
  //     final dayKey = Key('day_textFields_rules_edit_screen');

  //     await tester.pumpWidget(baseTester(
  //         child: BlocProvider(
  //             create: (context) =>
  //                 MenuNavigatorBloc(controller: PageController(initialPage: 0)),
  //             child: RulesEditScreen())));
  //     await tester.pumpAndSettle();

  //     expect(find.byKey(dayKey), findsOneWidget);
  //   });
  // });
}
