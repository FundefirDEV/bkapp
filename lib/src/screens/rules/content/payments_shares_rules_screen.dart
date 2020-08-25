import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rules/content/shares_containe_rules_screen.dart';
import 'package:bkapp_flutter/src/screens/rules/content/types_payments_container_rules_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class PaymentSharesContainerRulesScreen extends StatelessWidget {
  const PaymentSharesContainerRulesScreen({Key key, this.bankRules})
      : super(key: key);

  final BankRulesModel bankRules;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('main_row_payments_shares_container'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          key: Key('main_container_payments_shares_container'),
          height: 90.0,
          width: SizeConfig.blockSizeHorizontal * 40,
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 8,
            right: SizeConfig.blockSizeHorizontal * 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            key: Key('column_payment_container_rules_screen'),
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              Container(
                key: Key('payment_container_rules_screen'),
                child: Row(
                    key: Key('payment_row_rules_screen'),
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Icon(
                        Icons.cached,
                        color: Theme.of(context)
                            .colorScheme
                            .grayColor
                            .withOpacity(0.5),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                      Text(I18n.of(context).rulesScreenPayment,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.grayColor[400],
                              fontSize: 14))
                    ]),
              ),
              TypePfPaymentsRulesContainer(),
            ],
          ),
        ),
        SharesRulesContainer(bankRules: bankRules),
      ],
    );
  }
}
