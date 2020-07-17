import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopContainerContentProfileScreen {
  Container saloAndArrow() {
    return Container(
      key: Key('Top_container_profile_Screen'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: InkWell(
                key: Key('Salo_button_container_profile_Screen'),
                onTap: () => {},
                child: SvgPicture.asset('assets/images/salo_bot.svg')),
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal * 61,),
          InkWell(
              key: Key('Exit_button_container_profile_Screen'),
              onTap: () => {},
              child: SvgPicture.asset('assets/images/icon_exit.svg')),
        ],
      ),
    );
  }
}
