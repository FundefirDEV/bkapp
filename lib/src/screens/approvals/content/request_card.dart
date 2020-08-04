import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/cards_approvals_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestShareCard extends StatelessWidget {
  final int index;
  final int id;
  final String partnerName;
  final int amount;
  final int quantity;
  final String requestDate;
  final Function modalConfirm;

  const RequestShareCard(
      {Key key,
      this.id,
      this.partnerName,
      this.amount,
      this.requestDate,
      this.modalConfirm,
      this.index,
      this.quantity})
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
              child: CardsApprovalsContent(
                amount: amount,
                partnerName: partnerName,
                quantity: quantity,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    key: Key('inkwell-approve-modal-request-card-$index'),
                    onTap: () {
                      modalConfirm(
                          context,
                          I18n.of(context).approvalsScreenConfirmApprove,
                          I18n.of(context).approvalsScreenConfirmApproveBold +
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
                          I18n.of(context).approvalsScreenDeclineApprove,
                          I18n.of(context).approvalsScreenConfirmApproveBold +
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
}
