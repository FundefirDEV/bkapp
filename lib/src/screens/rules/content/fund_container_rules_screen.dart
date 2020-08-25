import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class FundRulesContainer extends StatelessWidget {
  const FundRulesContainer({Key key, this.bankRules}) : super(key: key);

  final BankRulesModel bankRules;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('container-fund-rules'),
      margin: EdgeInsets.only(top: 10),
      child: RichText(
          text: TextSpan(
              text: I18n.of(context).rulesScreenExpenseReserve + '\n',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300],
                  fontSize: 12),
              children: <TextSpan>[
            TextSpan(
                text: '${bankRules.expenseFundPercentage} %', // variable
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: 12))
          ])),
      alignment: Alignment(-0.6, -1.0),
    );
  }

  Container incobrableContainer(context, BankRulesModel bankRules) {
    return Container(
      key: Key('container-incobrable-rules'),
      margin: EdgeInsets.only(top: 10),
      child: RichText(
          text: TextSpan(
              text: I18n.of(context).rulesScreenIncobrableFund + '\n',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[300],
                  fontSize: 12),
              children: <TextSpan>[
            TextSpan(
                text: '${bankRules.badDebtReservePercentage} %', // variable
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[200],
                    fontSize: 12))
          ])),
      alignment: Alignment(-0.6, -1.0),
    );
  }
}
