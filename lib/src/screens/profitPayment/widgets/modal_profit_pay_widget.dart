import 'package:bkapp_flutter/core/models/profit_payment_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ModalProfitPayWidget extends StatelessWidget {
  const ModalProfitPayWidget({Key key, this.modalHeight, 
    this.onTapAccept,
    @required this.earningsMonth
  })
      : super(key: key);
  final double modalHeight;
  final DataEarningPerMonth earningsMonth;
  final Function onTapAccept;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BottomModal(
      //height: SizeConfig.blockSizeVertical * modalHeight,
      height: SizeConfig.blockSizeVertical * 40,
      child: Padding(
        padding: EdgeInsets.all(35),
        child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(
                  fontFamily: 'nunito',
                  fontSize: 35,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w100,
                  color: Theme.of(context).colorScheme.grayColor,
                ),
                text: earningsMonth.getEarning,
                children: [
                  TextSpan(
                      text:
                          '\n${I18n.of(context).profitPaymentProfitsModal}',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w800))
                ])),
        // Container(
        // width: SizeConfig.blockSizeHorizontal * 80,
        // child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Expanded(
        //           child: Container(
        //               alignment: Alignment.center,
        //               child: RichText(
        //                   textAlign: TextAlign.center,
        //                   text: TextSpan(
        //                       style: TextStyle(
        //                           fontFamily: 'nunito',
        //                           fontSize: 18,
        //                           fontWeight: FontWeight.bold,
        //                           color: Theme.of(context)
        //                               .colorScheme
        //                               .grayColor),
        //                       text: '10\n',
        //                       children: [
        //                         TextSpan(
        //                             text: I18n.of(context)
        //                                 .profitPaymentSharesToWithdraw,
        //                             style: TextStyle(
        //                                 fontSize: 16,
        //                                 fontWeight:
        //                                     FontWeight.w100))
        //                       ])))),
        //       Container(
        //           width: SizeConfig.blockSizeHorizontal * 0.2,
        //           height: 50,
        //           color: Theme.of(context).colorScheme.grayColor),
        //       Expanded(
        //         child: Container(
        //           alignment: Alignment.center,
        //           child: RichText(
        //               textAlign: TextAlign.center,
        //               text: TextSpan(
        //                   style: TextStyle(
        //                       fontFamily: 'nunito',
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                       color: Theme.of(context)
        //                           .colorScheme
        //                           .grayColor),
        //                   text: r'$350.000',
        //                   children: [
        //                     TextSpan(
        //                         text:
        //                             '\n${I18n.of(context).profitPaymentRemainderOfMoney}',
        //                         style: TextStyle(
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.w100))
        //                   ])),
        //         ),
        //       ),
        //     ])),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FlatButton(
              key: Key('flat_button_image_botton_modal_accept'),
              color: Theme.of(context).colorScheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: onTapAccept,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  I18n.of(context).profitPaymentPay.toUpperCase(),
                  key: Key('text_image_botton_modal_accept'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2.8,
                  ),
                ),
              )),
          FlatButton(
              key: Key('flat_button_image_botton_modal_close'),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                I18n.of(context).profitPaymentClose,
                key: Key('text_image_botton_modal_close'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2.8,
                ),
              )),
            ]
          ),
        ],     
      )),  
    ));
  }
}
