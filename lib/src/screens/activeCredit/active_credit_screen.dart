import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/index.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class ActiveCreditScreen extends StatefulWidget {
  ActiveCreditScreen(
      {Key key,
      @required this.oldIndex,
      @required this.userName,
      this.data,
      @required this.token})
      : super(key: key);

  final int oldIndex;
  final String userName;
  final ActiveCredit data;
  final String token;

  @override
  _ActiveCreditScreenState createState() => _ActiveCreditScreenState();
}

class _ActiveCreditScreenState extends State<ActiveCreditScreen> {

  final TextEditingController payAmount = TextEditingController();

  @override
  void initState() {
    payAmount.text = widget.data.scheduleInstallment[0].totalPayment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final creditFormBloc = BlocProvider.of<CreditFormBloc>(context);

    return AppBarWidget(
        key: Key('active-credit-screen'),
        userName: this.widget.userName,
        container: Column(
          children: <Widget>[
            TitleHeaderWidget(
                title: I18n.of(context).activeCreditCredits,
                oldIndex: HomeRoutesConstant.homeScreen,
                menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
            _subtitle(context),
            CardInformationBkWidget(
                childBlueWidth: 120,
                childBlue:
                    FeeNumberWidget(installment: widget.data.scheduleInstallment[0]),
                childWhite: FeeDetailWidget(
                  installment: widget.data.scheduleInstallment[0],
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
              width: SizeConfig.safeBlockHorizontal * 40,              
                child: TextField(
                controller: payAmount,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  //FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16)
                ],  
              ),
            ),
            _buttonPayFee(context , creditFormBloc),
            LineSeparatorWidget(),
            _subtitleFeePending(context),
            FeeCarrouselWidget(
              installments: widget.data.scheduleInstallment,
            ),
            DetailCreditWidget(
              activeCredits: widget.data,
            )
          ],
        ));
  }

  Container _subtitleFeePending(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
      child: Text(
        I18n.of(context).activeCreditPendingInstallment,
        key: Key('subtitle-fee-pending'),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
      ),
    );
  }

  Padding _buttonPayFee(BuildContext context , CreditFormBloc creditFormBloc) {
    // double totalPayment = double.parse(UtilsTools.removeMoneyFormatter(
    //     creditFormBloc.paymentAmount.value));
    double totalPayment = double.tryParse(UtilsTools.removeMoneyFormatter(
    payAmount.text));

    return Padding(
      padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
      child: RaisedButton(
          key: Key('raisedButton-pay-fee'),
          onPressed: () => BlocProvider.of<InstallmentsPaymentBloc>(context)
                  .add(PayInstallment(token: widget.token, installmentRequest: {
                "typeRequest": "installmentPayment",
                "idCredit": widget.data?.id,
                "idRequestPayment": widget.data?.scheduleInstallment[0]?.id,
                "amount": totalPayment
              })),
          color: Theme.of(context).colorScheme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: RichText(
              key: Key(''),
              text: TextSpan(
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4),
                  children: [
                    TextSpan(text: '${I18n.of(context).activeCreditPay} '),
                    TextSpan(
                        text: I18n.of(context).activeCreditInstallments,
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ]))),
    );
  }

  Container _subtitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 3,
          bottom: SizeConfig.safeBlockVertical * 4),
      child: Text(
        I18n.of(context).activeCreditNormal,
        key: Key('subtitle-credit'),
        style: TextStyle(color: Colors.white, letterSpacing: 4),
      ),
    );
  }
}
