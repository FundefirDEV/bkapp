import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profile/content/top_container_content_profile_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TopContainerProfileScreen {
  TopContainerContentProfileScreen content = TopContainerContentProfileScreen();
  Container topContainer(context) {
    return Container(
      key: Key('Top_container_profile_Screen'),
      height: SizeConfig.safeBlockVertical * 40,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          content.saloAndArrow(),
          TitleHeaderWidget(
            title: I18n.of(context).profileScreenProfile,
            showArrow: false,
          ),
          topContainerInformation(),
          Container(
              height: SizeConfig.safeBlockVertical * 4,
              child: FlatButton(
                  key: Key('Edit_button_profile_screen'),
                  onPressed: () =>
                      Navigator.pushNamed(context, profileEditScreen),
                  child: Text(
                    I18n.of(context).profileScreenEdit,
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }

  Container topContainerInformation() {
    return Container(
      key: Key('Top_container_information_profile_Screen'),
      child: Row(
        key: Key('row_top_container_profile_Screen'),
        children: <Widget>[
          Container(
              key: Key('Top_container_information_profile_Screen'),
              width: SizeConfig.blockSizeHorizontal * 35,
              child: SvgPicture.asset('assets/images/woman_profile.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  fit: BoxFit.contain,
                  key: Key('Profile_picture'))),
          Container(
            width: SizeConfig.blockSizeHorizontal * 65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: 'Denis Antnieta' '\n',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Rodriguez Gonzales' '\n',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'correo.test.email@gmail.com',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ]),
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/colombia_profile.svg',
                      height: 30.0,
                    ),
                    Text(
                      '3138129220',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
