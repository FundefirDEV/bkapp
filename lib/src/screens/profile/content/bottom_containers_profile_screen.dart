import 'dart:ui';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class BottomContainersProfileScreen {
  Row bottomContainers(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          key: Key('Credits_bottom_container_profile_screen'),
          margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 8,
              top: SizeConfig.blockSizeVertical * 2),
          child: RichText(
            key: Key('RichText_bottom_container_profile_screen'),
              text: TextSpan(
                  text:  I18n.of(context).profileScreenMy + ' ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                  children: <TextSpan>[
                TextSpan(
                  text: I18n.of(context).profileScreenCredit + '\n' + '\n',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor[900],
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                TextSpan(
                  text: '\$' + '1.000.000',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2,
                  ),
                ),
              ])),
        ),
        Container(
          key: Key('Actions_bottom_container_profile_screen'),
          margin: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal * 8,
              top: SizeConfig.blockSizeVertical * 2),
          child: RichText(
              key: Key('RichText_bottom_container_profile_screen'),
              text: TextSpan(
                  text: I18n.of(context).profileScreenMys + ' ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                  children: <TextSpan>[
                TextSpan(
                  text: I18n.of(context).profileScreenShares + '\n' + '\n',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor[900],
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                TextSpan(
                  text: '\$' + '50',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).colorScheme.grayColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2,
                  ),
                ),
              ])),
        )
      ],
    );
  }
}
