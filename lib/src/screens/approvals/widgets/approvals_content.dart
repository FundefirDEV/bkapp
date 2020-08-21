import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/approvals_cards.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/empty_information.dart';
import 'package:flutter/material.dart';

class ApprovalsContent extends StatelessWidget {
  const ApprovalsContent({Key key, @required this.data, @required this.token})
      : super(key: key);

  final Map data;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('main-container-scroolable-approvals-screen'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ApprovalsCards(
              title: I18n.of(context).approvalsScreenShares,
              data: data['sharesRequest'],
              emptyData: EmptyInformation(),
              token: token,
              type: 'share'),
          ApprovalsCards(
              title: I18n.of(context).approvalsScreenCredits,
              data: data['creditRequest'],
              emptyData: EmptyInformation(),
              token: token,
              type: 'credit'),
          ApprovalsCards(
              title: I18n.of(context).approvalsScreenPayments,
              data: data['paymentInstallmentRequest'],
              emptyData: EmptyInformation(),
              token: token,
              type: 'paymentInstallment'),
        ],
      ),
    );
  }
}
