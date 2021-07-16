import 'package:bkapp_flutter/core/bloc/approvalBloc/approvals_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/approvals/approvals_screen.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/accepted_discarted_container.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/number_petitions.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart' as flutterTest;


import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../base_tester.dart';

class MockApprovalsBloc extends MockBloc<ApprovalsEvent, ApprovalsState>
    implements ApprovalsBloc {}

class FakeApprovalsEvent extends Fake implements ApprovalsEvent {}
class FakeApprovalsState extends Fake implements ApprovalsState {}


void main() {
  // ignore: close_sinks
  ApprovalsBloc mockApprovalsBloc = new ApprovalsBloc(repository: null);
  final testKey = Key('my-id');

  setUpAll(() {
    registerFallbackValue<ApprovalsEvent>(FakeApprovalsEvent());
    registerFallbackValue<ApprovalsState>(FakeApprovalsState());
  });

  setUp(() {
    mockApprovalsBloc = MockApprovalsBloc();
  });

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


//  child: ApprovalsScreen(key: key, oldIndex: 0, userName: 'Usuario')),
  Widget approvalTester(Key key) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => MenuNavigatorBloc(controller: PageController())),
      BlocProvider(
        create: (context) => ApprovalsBloc(repository: null),
      )
    ], child: ApprovalsScreen(key: key, oldIndex: 0, userName: 'Usuario'));
  }

  flutterTest.group('Test approvals_screen', () {
    flutterTest.testWidgets('Find approvalsScreen ', (flutterTest.WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(baseTester(
            child: approvalTester(
          testKey,
        )));
        await tester.pump();

        expect(flutterTest.find.byKey(testKey), flutterTest.findsOneWidget);
      });
    });

    flutterTest.testWidgets('Find structure approvals screen', (flutterTest.WidgetTester tester) async {

      when(() => mockApprovalsBloc.state)
          .thenReturn(ApprovalsLoaded(approvals: response));
      await tester.pumpWidget(baseTester(
          child: MultiBlocProvider(
              providers: [
            BlocProvider<MenuNavigatorBloc>(
                create: (context) =>
                    MenuNavigatorBloc(controller: PageController())),
            BlocProvider.value(value: mockApprovalsBloc)
          ],
              child: ApprovalsScreen(
                  key: testKey, oldIndex: 0, userName: 'Usuario'))));
      await tester.pumpAndSettle();

      expect(flutterTest.find.byType(AppBarWidget), flutterTest.findsOneWidget);
      expect(flutterTest.find.byType(NumberPetitions), flutterTest.findsOneWidget);
      expect(flutterTest.find.byType(AcceptedDiscarted), flutterTest.findsOneWidget);
      expect(flutterTest.find.byKey(Key('column-appbar-approvals-screen')), flutterTest.findsOneWidget);
    });
  });
}
