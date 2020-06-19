
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopContainerContentProfileScreen { 
  
  Container profileAndArrow() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        key: Key('row_top_container_profile_Screen'),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            key: Key('Back_button_profile_screen'),
            onPressed: () => {},
            shape: CircleBorder(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
          Text(
            'Perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: SizeConfig.safeBlockHorizontal * 40),
        ],
      ),
    );
  }

  Container saloAndArrow() {
    return Container(
      key: Key('Top_container_profile_Screen'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
              key: Key('Salo_button_container_profile_Screen'),
              color: Colors.transparent,
              onPressed: () => {},
              shape: CircleBorder(),
              child: SvgPicture.asset('assets/images/salo_bot.svg')),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 30,
          ),
          FlatButton(
              key: Key('Exit_button_container_profile_Screen'),
              onPressed: () => {},
              shape: CircleBorder(),
              child: SvgPicture.asset('assets/images/icon_exit.svg')),
        ],
      ),
    );
  }
}