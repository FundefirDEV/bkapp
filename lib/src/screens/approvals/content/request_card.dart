import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class RequestShareCard extends StatelessWidget {
  final int index;
  final String requesType;
  final String partnerName;
  final String price;
  final String quantity;
  final Function modalConfirm;

  const RequestShareCard(
      {Key key,
      this.requesType,
      this.partnerName,
      this.price,
      this.quantity,
      this.modalConfirm,
      this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: buildText(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    key: Key(
                        'inkwell-approve-modal-request-card-$index-$requesType'),
                    onTap: () {
                      modalConfirm(
                          context,
                          I18n().approvalsScreenConfirmApprove,
                          I18n().approvalsScreenConfirmApproveBold +
                              '${this.partnerName}?',
                          true,
                          true,
                          'assets/images/salo_pre_approved_modal.svg');
                    },
                    child: SvgPicture.asset(
                      'assets/images/approve.svg',
                      height: SizeConfig.blockSizeVertical * 6,
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      modalConfirm(
                          context,
                          I18n().approvalsScreenDeclineApprove,
                          I18n().approvalsScreenConfirmApproveBold +
                              '${this.partnerName}?',
                          true,
                          false,
                          'assets/images/sad_bot.svg');
                    },
                    child: Container(
                        height: 35,
                        width: 50,
                        child: SvgPicture.asset(
                          'assets/images/reject.svg',
                          fit: BoxFit.none,
                        )),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Container buildText(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(height: 2),
          text: TextSpan(
              text: this.partnerName + '\n',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.w700),
              children: <TextSpan>[
                TextSpan(
                    text: this.quantity + " ",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w700,
                    )),
                TextSpan(
                    text: this.requesType + '\n',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: this.price + '\n',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Theme.of(context).colorScheme.grayColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w700,
                    )),
              ])),
    );
  }
}
