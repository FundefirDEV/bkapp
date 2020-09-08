import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profile/content/top_container_content_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/imageCountry/image_country.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TopContainerProfileScreen {
  TopContainerContentProfileScreen content = TopContainerContentProfileScreen();
  Container topContainer(context, ProfileModel data) {
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
          topContainerInformation(data),
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

  Container topContainerInformation(ProfileModel data) {
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
                      text: UtilsTools.titleCase(data.firstname) + '\n',
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: UtilsTools.titleCase(data.lastname) + '\n',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: data.email,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ]),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 35,
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset(
                        imageCountry(data.country.iso),
                        height: 18.0,
                      ),
                      Text(
                        data.phone,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
