import 'dart:convert';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/approvals_cards.dart';
import 'package:flutter/material.dart';

class ApprovalsContent extends StatelessWidget {
  const ApprovalsContent({Key key, this.modalConfirm}) : super(key: key);

  final Function modalConfirm;

  @override
  Widget build(BuildContext context) {
    List sharesExample = jsonDecode(
        '[{"name":"Marcos Nope","type":"acciones","price":"20000.0","quantity":"2"},{"name":"Gibran Raydan","type":"acciones","price":"30000.0","quantity":"3"},{"name":"Daniel Tavera","type":"acciones","price":"30000.0","quantity":"3"}]');
    List creditExample = jsonDecode(
        '[{"name":"Marcos Nope","type":"crédito","price":"200000.0", "quantity":"1"},{"name":"Gibran Raydan","type":"crédito","price":"300000.0", "quantity":"1"},{"name":"Daniel Tavera","type":"crédito","price":"30000.0", "quantity":"1"}]');
    List paymentExample = jsonDecode(
        '[{"name":"Marcos Nope","type":"pago","price":"200000.0", "quantity":"1"},{"name":"Gibran Raydan","type":"pago","price":"300000.0", "quantity":"1"},{"name":"Daniel Tavera","type":"pago","price":"30000.0", "quantity":"1"}]');
    return Container(
      key: Key('Main-container-scroolable-approvals-screen'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ApprovalsCards(
            title: I18n.of(context).approvalsScreenShares,
            data: sharesExample,
            emptyData: noDataContainer(context),
            modalConfirm: modalConfirm,
          ),
          ApprovalsCards(
            title: I18n.of(context).approvalsScreenCredits,
            data: creditExample,
            emptyData: noDataContainer(context),
            modalConfirm: modalConfirm,
          ),
          ApprovalsCards(
            title: I18n.of(context).approvalsScreenPayments,
            data: paymentExample,
            emptyData: noDataContainer(context),
            modalConfirm: modalConfirm,
          ),
        ],
      ),
    );
  }
}

Container noDataContainer(context) {
  return Container(
      child: Text(
    I18n.of(context).approvalsScreenNoRequest,
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  ));
}
