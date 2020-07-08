import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleStatusCreditWidget extends StatelessWidget {
  const TitleStatusCreditWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('title-status-credit-container'),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        key: Key('row-title-status-credit-container'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: Key('left-arrow-image-container-title-status-credit'),
            alignment: Alignment.centerLeft,
            width: SizeConfig.blockSizeHorizontal * 27,
            child: SvgPicture.asset(
              'assets/images/left_arrow.svg',
              key: Key('image-left-arrow-title-status-credit'),
              color: Colors.white,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
          Container(
            key: Key('title-status-credit-container-text'),
            width: SizeConfig.blockSizeHorizontal * 50,
            child: Text(
              I18n.of(context).approvalsScreenCredits,
              key: Key('title-status-credit-text'),
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
