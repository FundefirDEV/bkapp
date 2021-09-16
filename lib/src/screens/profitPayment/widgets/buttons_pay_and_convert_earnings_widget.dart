import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/core/models/profit_payment_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/modal_profit_pay_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter/material.dart';

import 'modal_convert_shares_widget.dart';

class ButtonsPayAndConvertEarningsWidget extends StatelessWidget {
  const ButtonsPayAndConvertEarningsWidget({Key key, this.selectedYearsPay,
  @required this.earningPerMonth})
      : super(key: key);
  final List<String> selectedYearsPay;
  final DataEarningPerMonth earningPerMonth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          RaisedButton(
              key: Key('raised-button-profit-payment'),
              onPressed: () {
                final profitForm = context.read<ProfitPaymentFormBloc>();
                _showDialogConvertShares(context,50.0,profitForm, () {
                  Navigator.pop(context);
                  print(profitForm.getProfitRes());

                  context.read<ProfitPaymentBloc>().add(ConvertShares(
                    token: profitForm.userToken.value, 
                    partnerId: profitForm.idPartner.value, 
                    earningShareIds: profitForm.dataEarningPerMonth.earningShareIds,  
                    earning: profitForm.dataEarningPerMonth.earning,
                    shareValue: profitForm.shareValue.valueToDouble,
                    quantity: profitForm.getShareQuantity())
                  );
                });
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
            onPressed: () {
              _showDialogPayment(context, 55.0, () {
                Navigator.pop(context);
                // context
                //     .read<ProfitPaymentBloc>()
                //     .add(TurnIntoShares(yearsTurnIntoShares: selectedYearsPay));
                final profitForm = context.read<ProfitPaymentFormBloc>();
                 context
                  .read<ProfitPaymentBloc>().add(
                    PayProfits(
                      earningShareIds: profitForm.dataEarningPerMonth.earningShareIds, 
                      idPartner: profitForm.idPartner.value, 
                      token: profitForm.userToken.value )
                );
                profitForm.clearDataEarning();
              });
            },
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

  void _showDialogConvertShares(
    context, modalHeight,
    ProfitPaymentFormBloc profitForm, 
    Function onTapConvertShares , 
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ModalConvertSharesWidget(
          modalHeight: modalHeight, 
          onTapAccept: onTapConvertShares , 
          shareQuantity: profitForm.getShareQuantity(), 
          profitRes: profitForm.getProfitRes()
        );
      }
    );
  }

  void _showDialogPayment(context, modalHeight, Function onTapPaymentProfit) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ModalProfitPayWidget(
            modalHeight: modalHeight, onTapAccept: onTapPaymentProfit,
            earningsMonth: earningPerMonth);
      }
    );
  }
}
