import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profile/content/top_container_content_profile_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
class TopContainerEditProfileScreen {
  Container topContainer(context) {
  TopContainerContentProfileScreen content = TopContainerContentProfileScreen();
    return Container(
      key: Key('Top_container_profile_edit_Screen'),
      height: SizeConfig.safeBlockVertical * 37,
      width: SizeConfig.safeBlockHorizontal * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryColorDark[50],
            Theme.of(context).colorScheme.primaryColor[100]
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        key: Key('Top_container_column_profile_edit_Screen'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          content.saloAndArrow(),
          content.profileAndArrow(),
          topContainerInformation(),
          Container(
              height: SizeConfig.safeBlockVertical * 4,
              child: Text(
                I18n.of(context).profileEditScreenEditionMode,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Container topContainerInformation() {
    return Container(
      key: Key('Top_container_info_profile_edit_Screen'),
      height: SizeConfig.safeBlockVertical * 15.5,
      child: Container(
          child: SvgPicture.asset('assets/images/woman_profile.svg',
              key: Key('Picture_rofile_edit_screen'))),
    );
  }
}
