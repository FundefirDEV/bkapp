import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopContainerContentRulesScreen {


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
