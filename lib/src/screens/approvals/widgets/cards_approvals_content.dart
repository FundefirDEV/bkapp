import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardsApprovalsContent extends StatelessWidget {
  const CardsApprovalsContent(
      {Key key, this.partnerName, this.amount, this.quantity, this.type})
      : super(key: key);

  final String partnerName;
  final double amount;
  final int quantity;
  final String type;
  @override
  Widget build(BuildContext context) {
    final formatConfig =
        NumberFormat.currency(locale: 'es', decimalDigits: 0, symbol: '');

    final totalQuantity =
        quantity != null ? formatConfig.format(quantity) : quantity;

    final totalAmount = formatConfig.format(amount);

    final bool isCredit = type == 'share';

    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          partnerName != ''
              ? Expanded(
                  child: Text(
                    partnerName,
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                )
              : SizedBox(height: 15),
          Expanded(
            child: RichText(
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(height: 1),
                text: TextSpan(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      if (isCredit)
                        TextSpan(
                            text: totalQuantity.toString() + ' ',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Theme.of(context).colorScheme.grayColor,
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
                              fontWeight: FontWeight.w700,
                            )),
                      if (isCredit)
                        TextSpan(
                            text: I18n.of(context).approvalsScreenShares + '\n',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Theme.of(context).colorScheme.grayColor,
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
                              fontWeight: FontWeight.w400,
                            )),
                      TextSpan(
                          text: '\$' + totalAmount.toString() + '\n',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Theme.of(context).colorScheme.grayColor,
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            fontWeight: FontWeight.w700,
                          )),
                    ])),
          ),
        ],
      ),
    );
  }
}
