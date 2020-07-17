import 'package:bkapp_flutter/src/screens/activeCredit/widgets/fee_next_card_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class FeeCarrouselWidget extends StatelessWidget {
  FeeCarrouselWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Carousel(
        viewportFraction: 0.6,
        heigthContainer: 180,
        children: <Widget>[for (var i = 0; i < 3; i++) FeeNextCardWidget()]);
  }
}
