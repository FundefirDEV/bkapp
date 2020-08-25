import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'credits_rules_container.dart';
import 'interest_rules_container.dart';

class CreditInterestContainerRulesScreen extends StatelessWidget {
  const CreditInterestContainerRulesScreen({Key key, this.bankRules})
      : super(key: key);

  final BankRulesModel bankRules;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('main_Row_credit_interest_containers_rules_screen'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          key: Key('main_credit_container_rules_screen'),
          height: 130.0,
          width: SizeConfig.blockSizeHorizontal * 40,
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 4,
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
            key: Key('column_credit_container_rules_screen'),
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              Container(
                key: Key('credit_container_rules_screen'),
                child: Row(
                    key: Key('row_container_rules_screen'),
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Icon(
                        Icons.credit_card,
                        color: Theme.of(context)
                            .colorScheme
                            .grayColor
                            .withOpacity(0.5),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                      Text(I18n.of(context).rulesScreenCredit,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.grayColor[400],
                              fontSize: 14))
                    ]),
              ),
              CreditsRulesContainer(bankRules: bankRules),
              CreditsRulesContainer().duesContainer(context, bankRules),
            ],
          ),
        ),
        InterestRulesContainer(bankRules: bankRules),
      ],
    );
  }
}
