import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/approvals/approvals_screen.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/accepted_discarted_container.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/request_card.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../base_tester.dart';

void main() {
  Widget approvalTester({ key }) {
    return BlocProvider(
      create: (context) => MenuNavigatorBloc(controller: PageController()),
      child: ApprovalsScreen(key: key, oldIndex: 0)
    );
  }

  group('Test approvals_screen', () {
    testWidgets('Find approvalsScreen ', (WidgetTester tester) async {
      final widgetKey = Key('approval-key');
      final columnKey = Key('Column-appbar-approvals-screen');

      await tester.pumpWidget(baseTester(child: approvalTester(key: widgetKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(widgetKey), findsOneWidget);
    });
    testWidgets('Find scroolable approvalsScreen', (WidgetTester tester) async {
      final mainContainerKey =
          Key('Main-container-scroolable-approvals-screen');

      await tester.pumpWidget(baseTester(child: approvalTester()));
      await tester.pumpAndSettle();

      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(10));
      expect(find.byType(RequestShareCard), findsNWidgets(9));
    });

    testWidgets('Find AppBarWidget', (WidgetTester tester) async {

      await tester.pumpWidget(baseTester(child: approvalTester()));
      await tester.pumpAndSettle();

      expect(find.byType(AppBarWidget), findsOneWidget);
      expect(find.byType(AcceptedDiscarted), findsOneWidget);
    });
  });
}
