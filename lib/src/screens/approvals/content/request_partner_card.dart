import 'package:bkapp_flutter/src/screens/approvals/widgets/cards_approvals_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class RequestPartnerCard extends StatelessWidget {
  const RequestPartnerCard(
      {Key key, this.partnerName, this.amount, this.quantity, this.type})
      : super(key: key);

  final String partnerName;
  final double amount;
  final int quantity;
  final String type;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CardsApprovalsContent(
              amount: amount,
              partnerName: '',
              quantity: quantity,
              type: type,
            ),
          ),
          Container(
            height: 40,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryColor[100],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Center(
                child: Text(
              partnerName,
              style: TextStyle(color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
