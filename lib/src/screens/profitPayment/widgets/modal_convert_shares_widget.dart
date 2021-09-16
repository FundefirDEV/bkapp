import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ModalConvertSharesWidget extends StatelessWidget {
  const ModalConvertSharesWidget({
    Key key, 
    @required this.modalHeight, 
    @required this.onTapAccept,
    @required this.profitRes,
    @required this.shareQuantity,
  })

      : super(key: key);
  final double modalHeight;
  final Function onTapAccept;
  final double profitRes;
  final int shareQuantity;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BottomModal(
      height: SizeConfig.blockSizeVertical * modalHeight,
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
                      fontSize: 32,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).colorScheme.grayColor,
                    ),
                    text: shareQuantity.toString(),
                    children: [
                      TextSpan(
                        text: I18n.of(context).profitPaymentShares,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800))
                    ]  
                  )
                ),
              Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primaryColor[50],
                        Theme.of(context).colorScheme.primaryColor[100]
                      ],
                      stops: [
                        0,
                        1
                      ],
                      begin: Alignment(-1.00, 0.00),
                      end: Alignment(1.00, -0.00))),
              width: SizeConfig.blockSizeHorizontal * 80,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 22,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      letterSpacing: 3),
                      text:UtilsTools.formatTwoDecimals().format(profitRes) ,
                      children: [
                        TextSpan(
                          text:
                            '\n${I18n.of(context).profitPaymentProfitsModal}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold))
                      ]
                    )
                  ),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FlatButton(
                key: Key('flat_button_image_botton_modal_accept'),
                color: Theme.of(context).colorScheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: onTapAccept,
                child: Text(
                  I18n.of(context).profitPaymentConvert,
                  key: Key('text_image_botton_modal_accept'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2.8,
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
              ]),
            ],
          )
        ),
      )
    );
  }
}
