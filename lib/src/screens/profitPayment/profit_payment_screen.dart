import 'package:bkapp_flutter/core/bloc/profitPayment/bloc/profit_payment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/accordion_detail_profit_widget.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/box_profit_history_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfitPaymentScreen extends StatefulWidget {
  ProfitPaymentScreen(
      {Key key, @required this.userName, @required this.tokenUser})
      : super(key: key);
  final String userName;
  final String tokenUser;

  @override
  _ProfitPaymentScreenState createState() => _ProfitPaymentScreenState();
}

class _ProfitPaymentScreenState extends State<ProfitPaymentScreen> {
  List<String> selectedYearProfitPayment;
  String historyProfit = r'$0';

  @override
  void initState() {
    BlocProvider.of<ProfitPaymentBloc>(context)
        .add(ProfitPaymentInitialize(token: widget.tokenUser));
    super.initState();
    selectedYearProfitPayment = new List<String>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<ProfitPaymentBloc, ProfitPaymentState>(
        builder: (context, state) {
      if (state is ProfitPaymentFailure) {
        return ErrorPage();
      }
      if (state is ProfitPaymentLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Builder(
        builder: (context) {
          // ignore: close_sinks
          ProfitPaymentFormBloc profitPaymentFormBloc =
              context.bloc<ProfitPaymentFormBloc>();
          if (state is ProfitPaymentLoaded) {
            historyProfit = state.historyEarnings;
            profitPaymentFormBloc.userList.updateItems(state.partners);
          }
          return FormBlocListener<ProfitPaymentFormBloc, DropDownModel, Object>(
            key: Key('bloc-listener-profit-payment-screen'),
            onSuccess: (context, state) {
              context.bloc<ProfitPaymentBloc>().add(
                  ProfitPaymentPartnerSelected(
                      idPartner:
                          profitPaymentFormBloc.idPartner.value.toString()));
            },
            onFailure: (context, state) {
              UtilsTools.showErrorDialog(context, state.failureResponse);
            },
            child: AppBarWidget(
              userName: widget.userName,
              container: Column(
                children: <Widget>[
                  TitleHeaderWidget(
                    title: I18n.of(context).profitPaymentTitle,
                    showArrow: false,
                  ),
                  BoxProfitHistoyWidget(
                      historyEarnings: historyProfit,
                      profitPaymentFormBloc: profitPaymentFormBloc),
                  LineSeparatorWidget(),
                  if (state is ProfitPaymentDetail)
                    _detailProfitPayment(
                        context, state.profitPartner, selectedYearProfitPayment)
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget _detailProfitPayment(BuildContext context, ProfitPartnerModel detail,
      List<String> selectedYearProfitPayment) {
    return Container(
        child: Column(children: [
      _subtitleAccumulatedEarnings(context, detail.accumulableEarnings),
      _detailProfitAcordion(detail.profitDetail, selectedYearProfitPayment),
      if (selectedYearProfitPayment.length > 0)
        _buttonsPayAndConvertEarnings(context, selectedYearProfitPayment)
    ]));
  }

  Padding _buttonsPayAndConvertEarnings(
      BuildContext context, List<String> selectedYearProfitPayment) {
    return Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          RaisedButton(
              key: Key('raised-button-profit-payment'),
              onPressed: () {
                context.bloc<ProfitPaymentBloc>().add(TurnIntoShares(
                    yearsTurnIntoShares: selectedYearProfitPayment));
              },
              color: Theme.of(context).colorScheme.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                I18n.of(context).profitPaymentConvertToActions,
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white),
              )),
          OutlineButton(
            key: Key('outline-button-profit-payment'),
            onPressed: () {},
            child: Text(
              I18n.of(context).profitPaymentPay,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  color: Theme.of(context).colorScheme.grayColor),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            borderSide: BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          )
        ]));
  }

  Container _detailProfitAcordion(List<ProfitPartnerDetailModel> profitDetail,
      List<String> selectedYearProfitPayment) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: profitDetail.length,
          itemBuilder: (BuildContext context, int index) {
            return AccordionDetailProfitWidget(
                profitDetail: profitDetail[index],
                onSelectedProfitPayment: (value) {
                  setState(() {
                    value.pay
                        // ignore: unnecessary_statements
                        ? {
                            print('Año a pagar ganancias: ' + value.year),
                            selectedYearProfitPayment.add(value.year)
                          }
                        : selectedYearProfitPayment.remove(value.year);
                  });
                });
          }),
    );
  }

  Container _subtitleAccumulatedEarnings(
      BuildContext context, String accumulableEarnings) {
    return Container(
        child: Column(
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(
                    fontFamily: 'nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text:
                          '${I18n.of(context).profitPaymentProfitRetained}\n'),
                  TextSpan(
                      style: TextStyle(fontWeight: FontWeight.w100),
                      text:
                          '${I18n.of(context).profitPaymentPendingReceivable}\n')
                ])),
        Text(
          accumulableEarnings,
          style: TextStyle(
              fontFamily: 'nunito',
              color: Theme.of(context).colorScheme.grayColor,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
              fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
