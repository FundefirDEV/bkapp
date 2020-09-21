import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/confirmation_buy_shares.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  Widget confirmationBuySharesTester({key}) {
    ApprovalsModel approvals = new ApprovalsModel(
        myRequest: new MyRequest(
            sharesRequest: List<Request>(),
            creditRequest: List<Request>(),
            paymentInstallmentRequest: List<Request>()));

    Request request = new Request(
        id: 1,
        partnerName: "Javier Reyes",
        amount: '50000',
        quantity: '5',
        requestDate: DateTime.now().toString());

    approvals.myRequest.sharesRequest.add(request);
    approvals.myRequest.creditRequest.add(request);
    approvals.myRequest.paymentInstallmentRequest.add(request);

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController())),
          BlocProvider(
            create: (context) =>
                BuySharesBloc(repoApproval: null, repoHome: null),
          )
        ],
        child: ConfirmationBuyShares(
          key: key,
          userName: 'Usuario',
          approvals: approvals,
        ));
  }

  group('Test ConfirmationBuyShares  Widget', () {
    testWidgets('Render ConfirmationBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');

      await tester.pumpWidget(
          baseTester(child: confirmationBuySharesTester(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TitleBuyShareWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: TitleHeaderWidget(
        title: 'Title',
        key: testKey,
        oldIndex: 0,
        menuNavigatorBloc: null,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: CardInformationBkWidget(
        key: testKey,
        childBlueWidth: 100,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render SharesBuyText', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: SharesBuyText(key: testKey, textBuyShares: true)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    // testWidgets('ConfirmationBuyShares render structure',
    //     (WidgetTester tester) async {
    //   final testKey = Key('my-id');
    //   await tester.pumpWidget(
    //       baseTester(child: confirmationBuySharesTester(key: testKey)));
    //   await tester.pumpAndSettle();

    //   expect(find.byKey(Key('material-confirmation-buy-share-screen')),
    //       findsOneWidget);
    //   expect(find.byKey(Key('appbar-confirmation-buy-share-screen')),
    //       findsOneWidget);
    //   expect(find.byKey(Key('column-confirmation-buy-share-screen')),
    //       findsOneWidget);
    // });
  });
}
