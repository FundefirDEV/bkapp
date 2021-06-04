import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rulesEdit/content/textFields/ChangeRulesTextFieldWidget.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'content/top_container_edit_rules_screen.dart';

class RulesEditScreen extends StatefulWidget {
  RulesEditScreen({Key key , String this.token});

  final token;

  @override
  _RulesEditScreenState createState() => _RulesEditScreenState(token: token);
}

class _RulesEditScreenState extends State<RulesEditScreen> {

  _RulesEditScreenState({this.token});

  final token;


  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.read<MenuNavigatorBloc>();

    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            child: Container(
                color: Colors.grey[300],
                child: TopContainerEditRulesScreen(
                  navigateBloc: navigateBloc,
                )),
          ),
          Flexible(
            child: Container(
              height: SizeConfig.safeBlockVertical * 65,
              color: Colors.grey[300],
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.ordinaryInterestPercentage,
                            title: 'Ordinary interest percentage',
                            textInputType: TextInputType.number),
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.defaultRatePercentage,
                            title: 'defaultRatePercentage',
                            textInputType: TextInputType.number)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        ChangeRulesTextFieldWidget(
                          textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.creditMaxInstallments,
                          title: 'creditMaxInstallments',
                          textInputType: TextInputType.number),
                        ChangeRulesTextFieldWidget(
                          textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.creditMaxValue,
                          title: 'creditMaxValue',
                          textInputType: TextInputType.number)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.shareValue,
                            title: 'shareValue',
                            textInputType: TextInputType.number),
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.expenseFundPercentage,
                            title: 'expenseFundPercentage',
                            textInputType: TextInputType.number)
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.badDebtReservePercentage,
                            title: 'badDebtReservePercentage',
                            textInputType: TextInputType.number),
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.maxPercentageShareByPartner,
                            title: 'maxPercentageShareByPartner',
                            textInputType: TextInputType.number)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.maxActiveCreditsByPartner,
                            title: 'maxActiveCreditsByPartner',
                            textInputType: TextInputType.number),
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.maxCreditFactor,
                            title: 'maxCreditFactor',
                            textInputType: TextInputType.number)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ChangeRulesTextFieldWidget(
                            textFieldBloc: context.read<AppBloc>().rulesEditFormBloc.defaultInstallmentsPeriodDays,
                            title: 'defaultInstallmentsPeriodDays',
                            textInputType: TextInputType.number),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 6),
                      UpdateButton(token: token,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 5,
      width: SizeConfig.blockSizeHorizontal * 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).colorScheme.primaryColor),
      child: FlatButton(
        onPressed: ()=> _summit(context , token),
        child: Text(
          I18n.of(context).profileEditScreenUpdate,
          style: TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }

  _summit(BuildContext context , String token) async {
    final rulesEditFormBloc = context.read<AppBloc>().rulesEditFormBloc;
    rulesEditFormBloc.token.updateInitialValue(token);
    rulesEditFormBloc.token.updateValue(token);

    final res = await rulesEditFormBloc.sumit();
    if(res){

      print('go to rules');
      context.read<MenuNavigatorBloc>().add(ButtonPressed(
        goTo: HomeRoutesConstant.rulesScreen));
    }
  }
}
