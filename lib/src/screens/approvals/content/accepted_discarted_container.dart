import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:intl/intl.dart';

class AcceptedDiscarted extends StatelessWidget {
  const AcceptedDiscarted({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final formatConfig =
        NumberFormat.currency(locale: 'es', decimalDigits: 0, symbol: '');

    final totalRequestShares = formatConfig.format(data['totalRequestShares']);
    final totalPaymentRequest = data['totalPaymentRequest'] != null ?
        formatConfig.format(data['totalPaymentRequest']) : '0';

    return Padding(
      key: Key('value-approvals-padding'),
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3.5),
      child: Column(
        key: Key('Accepted-approvals-column-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              key: Key('approvals-column-text-value'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenActionRequested,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 12),
                ),
                Text(
                  totalRequestShares.toString(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 15),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              key: Key('rejected-approvals-column-container'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenPaymentRequested,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 12),
                ),
                Text(
                  totalPaymentRequest.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.grayColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
