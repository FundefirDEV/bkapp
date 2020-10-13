import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class DetailBkProfileWidget extends StatelessWidget {
  const DetailBkProfileWidget({Key key, this.profile}) : super(key: key);
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 90,
      margin: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              key: Key('Credits_bottom_container_profile_screen'),
              child: RichText(
                  key: Key('RichText_bottom_container_profile_screen'),
                  text: TextSpan(
                      text: I18n.of(context).profileScreenMy + ' ',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Theme.of(context).colorScheme.grayColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                      children: <TextSpan>[
                        TextSpan(
                          text: I18n.of(context).profileScreenCredit +
                              '\n' +
                              '\n',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Theme.of(context).colorScheme.grayColor[900],
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                        TextSpan(
                          text: profile.activeCredit,
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
          ),
          Expanded(
            child: Container(
              key: Key('Actions_bottom_container_profile_screen'),
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
                          text: I18n.of(context).profileScreenShares +
                              '\n' +
                              '\n',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Theme.of(context).colorScheme.grayColor[900],
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                        TextSpan(
                          text: profile.shares.toString(),
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
          )
        ],
      ),
    );
  }
}
