import 'package:bkapp_flutter/src/screens/profile/widgets/header_profile_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';

class TopContainerEditProfileScreen extends StatelessWidget {
  const TopContainerEditProfileScreen({Key key, @required this.profile})
      : super(key: key);
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      type: MaterialType.transparency,
      child: Container(
        //color: Theme.of(context).colorScheme.grayColor[100],
        child: Stack(children: <Widget>[
          new Positioned(
            top: 0,
            child: Container(
              key: Key('Top_container_profile_Screen'),
              width: SizeConfig.safeBlockHorizontal * 100,
              height: SizeConfig.screenHeight * .30,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .primaryColorDark[50],
                    Theme.of(context).colorScheme.primaryColor[100]
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              )
            )
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 6,
                vertical: SizeConfig.blockSizeVertical * 4
              ),
                child: Column(children: <Widget>[
                  TitleHeaderWidget(
                      title: I18n.of(context).profileScreenProfile,
                      showArrow: false),
                  HeaderProfileWidget(profile: profile),]
                )
              )
            )
          ]
        )
      )
    );
  }
}
