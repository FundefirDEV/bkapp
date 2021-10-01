import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ModalConvertSharesWidget extends StatefulWidget {
  const ModalConvertSharesWidget({
    Key key, 
    @required this.modalHeight, 
    @required this.onTapAccept,
    @required this.profitForm,
  })

      : super(key: key);
  final double modalHeight;
  final Function onTapAccept;
  final ProfitPaymentFormBloc profitForm;

  @override
  _ModalConvertSharesWidgetState createState() => _ModalConvertSharesWidgetState();
}

class _ModalConvertSharesWidgetState extends State<ModalConvertSharesWidget> {

  int shareQuantity = 0;
  int maxShares = 0;
  double earning = 0.0;
  double profitRes = 0.0;
  double shareValue = 0.0;

  @override
  void initState() {
    widget.profitForm.initShareQuantityAndProfitRes();
    shareQuantity = widget.profitForm.shareQuantity;
    maxShares = shareQuantity;
    earning = widget.profitForm.dataEarningPerMonth.earning;
    shareValue = widget.profitForm.shareValue;
    profitRes = widget.profitForm.profitRes;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return BottomModal(
      height: SizeConfig.blockSizeVertical * widget.modalHeight,
      child: Padding(
        padding: EdgeInsets.all(35),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            text:' ' + I18n.of(context).profitPaymentShares,
                            style:TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800)),
                        ]  
                      )
                    ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            //shareQuantity = widget.profitForm.shareQuantity.valueToInt;
                            if(shareQuantity < maxShares){
                              shareQuantity ++;
                              widget.profitForm.updateShareQuantity(shareQuantity);
                              updateProfitRes();
                            }
                          });
                        } ,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical *0.5,
                            horizontal: SizeConfig.safeBlockVertical * 3),
                          child: Icon(Icons.keyboard_arrow_up , size: 35),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            //shareQuantity = widget.profitForm.shareQuantity.valueToInt;

                            if(shareQuantity > 0){
                              shareQuantity --;
                              widget.profitForm.updateShareQuantity(shareQuantity);
                              updateProfitRes();
                            }
                          });
                        } ,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical *0.5,
                            horizontal: SizeConfig.safeBlockVertical * 3),
                          child: Icon(Icons.keyboard_arrow_down , size: 35,),
                        ),
                      ),
                    ],
                  )
                ],
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
                      text: UtilsTools.formatTwoDecimals().format(profitRes) ,
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
                onPressed: widget.onTapAccept,
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
  void updateProfitRes(){
    final shareAmount =  shareQuantity * shareValue;
    profitRes = (earning - shareAmount);
  }
}
