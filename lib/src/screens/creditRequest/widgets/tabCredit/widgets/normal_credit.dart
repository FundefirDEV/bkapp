import 'package:bkapp_flutter/core/bloc/bankBloc/myBank/mybank_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:intl/intl.dart';

import 'number_actions_widget.dart';

class NormalCredit extends StatelessWidget {
  const NormalCredit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MyBankState bankState = BlocProvider.of<MyBankBloc>(context).state;

    int currentShares = 0;
    int currentCashBalance = 0;
    BankInfoModel bankInfo = new BankInfoModel();
    if (bankState is MyBankLoaded) {
      bankInfo = bankState.bankInfoModel;
      currentShares = int.parse(bankInfo.personal.shares);
      currentCashBalance = int.parse(
          UtilsTools.removeMoneyFormatter(bankInfo.group.cashBalance));
    }

    final maximumRequestFormula = currentShares * 10000 * 5;
    final maximumRequest = maximumRequestFormula > currentCashBalance
        ? currentCashBalance
        : maximumRequestFormula;
    final formatConfig =
        NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

    return CardInformationBkWidget(
      childBlue: NumberActions(bankInfoModel: bankInfo),
      childBlueWidth: SizeConfig.blockSizeHorizontal * 30,
      childWhite: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 2,
            horizontal: SizeConfig.safeBlockHorizontal * 8),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      I18n.of(context).creditScreenYouCanRequest,
                      // textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8,
                          color: Theme.of(context).colorScheme.grayColor[300]),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(formatConfig.format(maximumRequest).toString(),
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            color: Theme.of(context).colorScheme.grayColor[300],
                            fontWeight: FontWeight.w100)),
                  ),
                )
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      I18n.of(context).creditScreenWithInterest,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8,
                          color: Theme.of(context).colorScheme.grayColor[300]),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        bankState is MyBankLoaded
                            ? '${bankState.data.bankRulesModel.expenseFundPercentage}%'
                            : '0%',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            color: Theme.of(context).colorScheme.grayColor[300],
                            fontWeight: FontWeight.w100)),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
