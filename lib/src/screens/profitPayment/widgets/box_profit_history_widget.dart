import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/form_list_partner_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class BoxProfitHistoyWidget extends StatelessWidget {
  BoxProfitHistoyWidget({@required this.historyEarnings});

  final String historyEarnings;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
        child: Column(children: [
          Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Theme.of(context).colorScheme.primaryColor[100]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.historyEarnings,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 6,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 2),
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: 'nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                            children: [
                          TextSpan(text: I18n.of(context).profitPaymentHistory),
                          TextSpan(
                              text: I18n.of(context).profitPaymentProfits,
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]))
                  ])),
          FormListPartnerWidget()
        ]));
  }
}
