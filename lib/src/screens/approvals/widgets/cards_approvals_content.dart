import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardsApprovalsContent extends StatelessWidget {
  const CardsApprovalsContent(
      {Key key, this.partnerName, this.amount, this.quantity})
      : super(key: key);

  final String partnerName;
  final int amount;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    final formatConfig =
        NumberFormat.currency(locale: 'es', decimalDigits: 0, symbol: '');

    final totalQuantity =
        quantity != null ? formatConfig.format(quantity) : quantity;

    final totalAmount = formatConfig.format(amount);

    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              partnerName,
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
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
                      if (quantity != null)
                        TextSpan(
                            text: totalQuantity.toString() + ' ',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Theme.of(context).colorScheme.grayColor,
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
                              fontWeight: FontWeight.w700,
                            )),
                      if (quantity != null)
                        TextSpan(
                            text: I18n.of(context).approvalsScreenShares + '\n',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Theme.of(context).colorScheme.grayColor,
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
                              fontWeight: FontWeight.w400,
                            )),
                      TextSpan(
                          text: totalAmount.toString() + '\n',
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
