import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/credit_request_screen.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/widgets.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:bkapp_flutter/src/widgets/modals/preApprovedRequest/pre_approved_credit_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test credit screen', () {
    final key = Key('credit-key');
    testWidgets('Render credit screen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: BlocProvider(
          create: (context) => MenuNavigatorBloc(
            controller: PageController()
          ),
          child: CreditScreen(key: key, oldIndex: 0,)
        )
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Render main structure', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: BlocProvider(
          create: (context) => MenuNavigatorBloc(
            controller: PageController()
          ),
          child: CreditScreen(key: key, oldIndex: 0,)
        )
      ));
      await tester.pumpAndSettle();

      expect(find.byType(AppBarWidget), findsOneWidget);
      expect(find.byType(TabCreditTypeWidget), findsOneWidget);
      expect(find.byType(FormFields), findsOneWidget);
      expect(find.byKey(Key('raisedButton-accept')), findsOneWidget);
    });

    testWidgets('Render modal', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: BlocProvider(
          create: (context) => MenuNavigatorBloc(
            controller: PageController()
          ),
          child: CreditScreen(key: key, oldIndex: 0,)
        )
      ));
      await tester.pumpAndSettle();

      await tester.drag(find.byType(AppBarWidget), const Offset(0.0, -600.0));
      await tester.pumpAndSettle(Duration(milliseconds: 100));

      await tester.tap(find.byKey(Key('raisedButton-accept')));
      await tester.pumpAndSettle();
      expect(find.byType(PreApprovedCreditModal), findsOneWidget);
    });
  });
}
