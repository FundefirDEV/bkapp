import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/material.dart';

class CardGeneralDetailMeetingWidget extends StatelessWidget {
  const CardGeneralDetailMeetingWidget(
      {Key key,
      this.cashBalance = r'$0',
      this.badDebtReserve = r'$0',
      this.earningByShare = r'$0',
      this.fundReserve = r'$0'})
      : super(key: key);

  final String cashBalance;
  final String badDebtReserve;
  final String earningByShare;
  final String fundReserve;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 3),
        padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 3),
        child: CardInformationBkWidget(
            childBlueWidth: 130,
            childBlue: _childBlue(context),
            childWhite: _childWhite(context)));
  }

  Container _childBlue(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: RichText(
                key: Key(''),
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(text: I18n.of(context).meetingClosedCashBalance),
                      TextSpan(
                          text: this.cashBalance,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200)),
                    ])),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: RichText(
                key: Key(''),
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                          text:
                              I18n.of(context).meetingClosedEarningsPerShares),
                      TextSpan(
                          text: earningByShare,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200)),
                    ])),
          )),
        ],
      ),
    );
  }

  Container _childWhite(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 35),
        child: Column(children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: RichText(
                key: Key(''),
                text: TextSpan(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor,
                        fontFamily: 'Nunito',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(text: I18n.of(context).meetingClosedExpenseFund),
                      TextSpan(
                          text: this.badDebtReserve,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200)),
                    ])),
          )),
          Expanded(
              child: Container(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      key: Key(''),
                      text: TextSpan(
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.grayColor,
                              fontFamily: 'Nunito',
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                                text: I18n.of(context)
                                    .meetingClosedSustainabilityFund),
                            TextSpan(
                                text: this.fundReserve,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w200)),
                          ]))))
        ]));
  }
}
