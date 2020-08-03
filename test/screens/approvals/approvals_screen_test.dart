import 'package:bkapp_flutter/core/bloc/approvalBloc/approvals_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/approvals/approvals_screen.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/accepted_discarted_container.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/number_petitions.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../base_tester.dart';

class MockApprovalsBloc extends MockBloc<ApprovalsEvent, ApprovalsState>
    implements ApprovalsBloc {}

void main() {
  ApprovalsBloc mockApprovalsBloc;
  final testKey = Key('my-id');

  Map response = {
    "cashBalance": 5000000,
    "totalRequestShares": 2000000,
    "totalCreditRequest": 300000,
    "totalPaymentRequest": 1500000,
    "sharesRequest": [
      {
        "id": 1,
        "partnerName": "Marcos Nope",
        "amount": 50000,
        "quantity": 5,
        "requestDate": "2020/03/20"
      }
    ],
    "creditRequest": [
      {
        "id": 1,
        "partnerName": "Javier Reyes",
        "amount": 500000,
        "requestDate": "2020/03/20"
      }
    ],
    "paymentInstallmentRequest": [
      {
        "id": 1,
        "partnerName": "Sutatino Perencejo",
        "amount": 200000,
        "requestDate": "2020/04/20"
      }
    ]
  };

  setUp(() {
    mockApprovalsBloc = MockApprovalsBloc();
  });

  Widget approvalTester(Key key) {
    return BlocProvider(
        create: (context) => MenuNavigatorBloc(controller: PageController()),
        child: ApprovalsScreen(key: key, oldIndex: 0));
  }

  group('Test approvals_screen', () {
    testWidgets('Find approvalsScreen ', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: approvalTester(
        testKey,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure approvals screen', (WidgetTester tester) async {
      when(mockApprovalsBloc.state)
          .thenReturn(ApprovalsLoaded(approvals: response));
      await tester.pumpWidget(baseTester(
          child: MultiBlocProvider(providers: [
        BlocProvider<MenuNavigatorBloc>(
            create: (context) =>
                MenuNavigatorBloc(controller: PageController())),
        BlocProvider.value(value: mockApprovalsBloc)
      ], child: ApprovalsBuilder(key: testKey, oldIndex: 0))));
      await tester.pumpAndSettle();

      expect(find.byType(AppBarWidget), findsOneWidget);
      expect(find.byType(NumberPetitions), findsOneWidget);
      expect(find.byType(AcceptedDiscarted), findsOneWidget);
      expect(find.byKey(Key('column-appbar-approvals-screen')), findsOneWidget);
    });
  });
}
