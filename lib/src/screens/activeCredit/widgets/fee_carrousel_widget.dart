import 'dart:convert';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/fee_next_card_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class FeeCarrouselWidget extends StatelessWidget {
  FeeCarrouselWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List paymentExample = jsonDecode(
        '[{"date":"28 / 09 /2020","feeValue":"115.000"},{"date":"28 / 10 /2020","feeValue":"115.000"}]');

    SizeConfig().init(context);
    return Carousel(
        viewportFraction: 0.6,
        heigthContainer: 180,
        children: <Widget>[
          for (var i = 0; i < paymentExample.length; i++)
            FeeNextCardWidget(
              feeNumber: (i + 2).toString(),
              paymentDate: paymentExample[i]["date"],
              valueFee: paymentExample[i]["feeValue"],
            )
        ]);
  }
}
