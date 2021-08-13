import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rulesEdit/content/textFields/ChangeRulesTextFieldWidget.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
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
  void initState() {
   
    context.read<AppBloc>().rulesEditFormBloc.initValues(token);
    context.read<AppBloc>().rulesEditFormBloc.token.updateValue(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final navigateBloc = context.read<MenuNavigatorBloc>();
    final rulesEditFormBloc = context.read<AppBloc>().rulesEditFormBloc;

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
              width: SizeConfig.safeBlockHorizontal * 100,
              color: Colors.grey[300],
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.ordinaryInterestPercentage,
                      title: I18n.of(context).rulesScreenOrdinaryInterest,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.defaultRatePercentage,
                      title: I18n.of(context).rulesScreenBadDebtReservePercentage,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.creditMaxInstallments,
                      title: I18n.of(context).rulesScreenCreditMaxInstalment,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.creditMaxValue,
                      title: I18n.of(context).rulesScreenCreditMaxValue,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.shareValue,
                      title: I18n.of(context).rulesScreenSharesValue,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.expenseFundPercentage,
                      title: I18n.of(context).rulesScreenExpenseFoundPercentage,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.badDebtReservePercentage,
                      title: I18n.of(context).rulesScreenBadDebtReservePercentage,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.maxCreditFactor,
                      title: I18n.of(context).rulesScreenMaxCreditFactor,
                      textInputType: TextInputType.number),
                    ChangeRulesTextFieldWidget(
                      textFieldBloc: rulesEditFormBloc.defaultInstallmentsPeriodDays,
                      title: I18n.of(context).rulesScreenDefaultInstalmentsPeriodDays,
                      textInputType: TextInputType.number),
                    UpdateButton(token: token,),
                  ],
                ),
              ),
            ),
          ),
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

    final rulesEditFormBloc = context.read<AppBloc>().rulesEditFormBloc;

    return StreamBuilder(stream: rulesEditFormBloc.loadingStream,
      builder:(BuildContext context , AsyncSnapshot loadingsnapshot) {
        return Container(
          margin: EdgeInsets.only(bottom: 15 , top: 5),
          height: SizeConfig.blockSizeVertical * 5,
          width: SizeConfig.blockSizeHorizontal * 45,
          child: ElevatedButton(
            onPressed: loadingsnapshot.data != null && loadingsnapshot.data ? 
            null : () => _summit(context , token),
            child: loadingsnapshot.data != null && loadingsnapshot.data ?
              Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ): Text(
              I18n.of(context).profileEditScreenUpdate,
              style: TextStyle(color: Colors.white, letterSpacing: 4),
            ),
          ),
        );
      }
    );
  }

  _summit(BuildContext context , String token) async {
    final rulesEditFormBloc = context.read<AppBloc>().rulesEditFormBloc;
    rulesEditFormBloc.token.updateInitialValue(token);
    rulesEditFormBloc.token.updateValue(token);

    final res = await rulesEditFormBloc.sumit();
    if(res == 'Success'){

      context.read<MenuNavigatorBloc>().add(ButtonPressed(
        goTo: HomeRoutesConstant.rulesScreen)
      );
    } else {
      _showDialog(context , res);
    }
  }
  void _showDialog(context , String error) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return ImageBottomModal(
          modalHeight: 45.0,
          image: 'assets/images/sad_bot.svg',
          isImageBg: false,
          title: I18n.of(context).rulesScreenChangeRulesErrorTittle,
          titleBold: I18n.of(context).rulesScreenChangeRulesErrorTittleBlond,
          isBold: true,
          isBtnAccept: false,
          technicalData: error,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressCancel: () => {Navigator.pop(context)}
        );
    });
  }
}
