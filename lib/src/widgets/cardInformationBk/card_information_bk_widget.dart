import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class CardInformationBkWidget extends StatelessWidget {
  CardInformationBkWidget({
    Key key,
    this.childBlue,
    this.childWhite,
    this.childBlueWidth
  }) : super(key: key);

  final Widget childBlue;
  final Widget childWhite;
  final double childBlueWidth;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('card-buy-share-principal-container'),
      width: SizeConfig.blockSizeHorizontal * 85,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x11000000),
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 0)
          ]),
      child: Row(
        key: Key('row-card-buy-share'),
        children: <Widget>[
          Container(
            key: Key('blue-container-card-buy-share'),
            width: this.childBlueWidth ?? 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: Theme.of(context).colorScheme.primaryColor[100],
            ),
            child: this.childBlue,
          ),
          Expanded(
              flex: 2,
              key: Key('expanded-card-buy-share'),
              child: Container(
                  key: Key('white-container-card-buy-share'),
                  child: this.childWhite))
        ],
      ),
    );
  }
}
