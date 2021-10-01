import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/form_list_partner_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class BoxProfitHistoyWidget extends StatelessWidget {
  BoxProfitHistoyWidget({
    @required this.historyEarnings ,
    @required this.isAdmin,
    this.accumulableEarnings
  });

  final String historyEarnings;
  final bool isAdmin;
  final String accumulableEarnings;
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
                        ]
                      )
                    )
                  ]
                )
              ),
          isAdmin ? 
            FormListPartnerWidget():
            profitHistoryBox(context)
        ]
      )
    );
  }

  Container profitHistoryBox(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      height: SizeConfig.blockSizeVertical * 11,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 45.0, right: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
          color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.accumulableEarnings,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'nunito',
              color: Colors.black,
              fontSize: SizeConfig.blockSizeHorizontal * 4.5,
              fontWeight: FontWeight.w100,
              letterSpacing: 2),
          ),
          Text('${I18n.of(context).profitPaymentProfitRetained}'),
        ],
      ),
    );
  }
}
