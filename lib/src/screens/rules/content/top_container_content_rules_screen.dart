import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopContainerContentRulesScreen {
  Container titleAndArrow(context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 0.3),
      child: Row(
        key: Key('row_top_container_content_rules_Screen'),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            key: Key('back_button_content_rules_screen'),
            onPressed: () => {},
            shape: CircleBorder(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal * 12),
          Text(
            I18n.of(context).rulesScreenBkRules,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal * 25),
        ],
      ),
    );
  }

  Container saloAndArrow() {
    return Container(
      key: Key('top_container_content_rules_Screen'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 5,
            child: InkWell(
                key: Key('salo_button_container_content_rules_Screen'),
                onTap: () => {},
                child: SvgPicture.asset('assets/images/salo_bot.svg')),
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal * 61,),
          InkWell(
              key: Key('exit_button_container_content_rules_Screen'),
              onTap: () => {},
              child: SvgPicture.asset('assets/images/icon_exit.svg')),
        ],
      ),
    );
  }
}
