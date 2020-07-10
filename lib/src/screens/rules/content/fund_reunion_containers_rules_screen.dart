import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rules/content/reunion_rules_container.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'fund_container_rules_screen.dart';

class FundReunionContainersRulesScreen extends StatelessWidget {
  const FundReunionContainersRulesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('main_row_funds_reunion_container'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          key: Key('main_container_funds_reunion_container'),
          height: SizeConfig.blockSizeVertical * 18,
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
            key: Key('column_funds_reunion_screen'),
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              Container(
               key: Key('funds_container_rules_screen'),
                child: Row(
                  key: Key('funds_row_rules_screen'),
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Icon(
                        Icons.account_balance,
                        color: Theme.of(context)
                            .colorScheme
                            .grayColor
                            .withOpacity(0.5),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                      Text(I18n.of(context).rulesScreenFunds,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.grayColor[400],
                              fontSize: 14))
                    ]),
              ),
              FundRulesContainer(),
              FundRulesContainer().incobrableContainer(context),
            ],
          ),
        ),
        ReunionRulesContainer(),
      ],
    );
  }
}
