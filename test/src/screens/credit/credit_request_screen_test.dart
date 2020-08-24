import 'package:bkapp_flutter/core/bloc/approvalBloc/approvals_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/approvals_repository.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/credit_repository.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/credit_request_screen.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/widgets.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../base_tester.dart';

class ApprovalsRepoMock extends Mock implements ApprovalsRepository {}

class CreditRepoMock extends Mock implements CreditRepository {}

void main() {
  ApprovalsRepository approvalsRepoMock = ApprovalsRepoMock();
  CreditRepository creditRepoMock = CreditRepoMock();

  baseWidgetTest({Key customKey}) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController())),
          BlocProvider(
              create: (context) =>
                  ApprovalsBloc(repository: approvalsRepoMock)),
          BlocProvider(
              create: (context) =>
                  CreditFormBloc(creditRepository: creditRepoMock))
        ],
        child: CreditScreen(
            key: customKey,
            oldIndex: 0,
            tokenUser: 'xxx',
            userName: 'Usuario'));
  }

  group('Test credit screen', () {
    final key = Key('credit-key');
    testWidgets('Render credit screen', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester
            .pumpWidget(baseTester(child: baseWidgetTest(customKey: key)));
        await tester.pump();
        expect(find.byKey(key), findsOneWidget);
      });
    });

    testWidgets('Render main structure', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester
            .pumpWidget(baseTester(child: baseWidgetTest(customKey: key)));
        await tester.pump();

        expect(find.byType(AppBarWidget), findsNothing);
        expect(find.byType(TabCreditTypeWidget), findsNothing);
        expect(find.byType(FormFields), findsNothing);
        expect(find.byKey(Key('raisedButton-accept')), findsNothing);
      });
    });

    // testWidgets('Render modal', (WidgetTester tester) async {
    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(baseTester(
    //       child: baseWidgetTest(customKey: key)
    //     ));
    //     await tester.pump();

    //     await tester.drag(find.byType(AppBarWidget), const Offset(0.0, -600.0));
    //     await tester.pump(Duration(milliseconds: 100));

    //     await tester.tap(find.byKey(Key('raisedButton-accept')));
    //     await tester.pump();
    //     expect(find.byType(PreApprovedCreditModal), findsNothing);
    //   });
    // });
  });
}
