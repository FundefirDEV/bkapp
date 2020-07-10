import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'content/credit_interest_containers_rules_screen.dart';
import 'content/fund_reunion_containers_rules_screen.dart';
import 'content/payments_shares_rules_screen.dart';
import 'content/top_container_rules_screen.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('scaffold_rules_screen'),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
              key: Key('top_main_container_rules_screen'),
              color: Theme.of(context).colorScheme.grayColor[100],
              child: TopContainerRulesSceen()),
          Container(
            key: Key('bottom_main_container_rules_screen'),
            height: SizeConfig.safeBlockVertical * 62,
            width: SizeConfig.safeBlockHorizontal * 100,
            color: Theme.of(context).colorScheme.grayColor[100],
            child: Column(
              children: <Widget>[
                CreditInterestContainerRulesScreen(),
                PaymentSharesContainerRulesScreen(),
                FundReunionContainersRulesScreen(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
