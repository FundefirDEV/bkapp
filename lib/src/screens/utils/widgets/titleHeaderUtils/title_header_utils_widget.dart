import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleHeaderUtilsWidget extends StatelessWidget {
  const TitleHeaderUtilsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('title-util-container'),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      child: Row(
        key: Key('row-title-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: Key('left-arrow-image-container-title-util'),
            alignment: Alignment.centerLeft,
            width: SizeConfig.blockSizeHorizontal * 35,
            child: SvgPicture.asset(
              'assets/images/left_arrow.svg',
              key: Key('image-left-arrow-title-util'),
              color: Colors.white,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
          Container(
            key: Key('title-util-container-text'),
            width: SizeConfig.blockSizeHorizontal * 50,
            child: Text(
              I18n.of(context).utilsUtils,
              key: Key('title-util-text'),
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 7,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
