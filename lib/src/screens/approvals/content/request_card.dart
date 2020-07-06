import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/approveDiscardRequest/approve_credit_modal.dart';
import 'package:bkapp_flutter/src/widgets/modals/approveDiscardRequest/discard_credit_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class RequestShareCard extends StatelessWidget {
  final String requesType;
  final String partnerName;
  final String price;
  final String quantity;


  const RequestShareCard({Key key, this.requesType, this.partnerName, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
        height: SizeConfig.safeBlockVertical * 18,
        width: SizeConfig.blockSizeHorizontal * 3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildText(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  child: InkWell(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              ApproveCreditModal()),
                      child: SvgPicture.asset(
                        'assets/images/approve.svg',
                        height: SizeConfig.blockSizeVertical * 6,
                      )),
                ),
                Container(
                  child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              DiscardCreditModal()),
                      icon: SvgPicture.asset('assets/images/reject.svg')),
                )
              ],
            ),
          ],
        ));
  }

  RichText buildText(context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: this.partnerName + '\n',
            style: TextStyle(
                color: Theme.of(context).colorScheme.grayColor,
                fontSize: 15,
                fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                  text: this.quantity + " ",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(
                  text: this.requesType + '\n',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(
                  text: this.price + '\n',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
            ]));
  }
}
