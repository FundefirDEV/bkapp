import 'package:bkapp_flutter/core/bloc/bankRulesbloc/bank_rules_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'content/credit_interest_containers_rules_screen.dart';
import 'content/fund_reunion_containers_rules_screen.dart';
import 'content/payments_shares_rules_screen.dart';
import 'content/top_container_rules_screen.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RulesScreen extends StatefulWidget {
  RulesScreen({Key key, @required this.tokenUser}) : super(key: key);
  final String tokenUser;
  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  @override
  void initState() {
    context
        .read<BankRulesBloc>()
        .add(BankRulesInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.read<MenuNavigatorBloc>();
    SizeConfig().init(context);

    return BlocBuilder<BankRulesBloc, BankRulesState>(
        builder: (context, state) {
      if (state is BankRulesLoaded) {
        return Scaffold(
          key: Key('scaffold_rules_screen'),
          body: SafeArea(
            child: Column(children: <Widget>[
              Container(
                  key: Key('top_main_container_rules_screen'),
                  color: Theme.of(context).colorScheme.grayColor[100],
                  child: TopContainerRulesSceen(
                      navigateBloc: navigateBloc,
                      bankRules: state.bankRulesModel)),
              // Text(state.bankRulesModel.badDebtReservePercentage.toString()),
              Expanded(
                child: Container(
                  key: Key('bottom_main_container_rules_screen'),
                  color: Theme.of(context).colorScheme.grayColor[100],
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditInterestContainerRulesScreen(
                            bankRules: state.bankRulesModel),
                        PaymentSharesContainerRulesScreen(
                            bankRules: state.bankRulesModel),
                        FundReunionContainersRulesScreen(
                            bankRules: state.bankRulesModel),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        );
      }
      if (state is BankRulesFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
