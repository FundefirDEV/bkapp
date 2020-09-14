import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class SubtitleAccumulatedEarningsWidget extends StatelessWidget {
  const SubtitleAccumulatedEarningsWidget(
      {Key key, @required this.accumulableEarnings})
      : super(key: key);
  final String accumulableEarnings;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
