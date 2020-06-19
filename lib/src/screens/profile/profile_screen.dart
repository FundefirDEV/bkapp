import 'package:bkapp_flutter/src/screens/profile/content/bottom_containers_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/content/gain_button_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/content/middle_container_profile_screen.dart';
import 'package:bkapp_flutter/src/screens/profile/content/top_container_profile_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TopContainerProfileScreen topContainer = new TopContainerProfileScreen();
    MiddleContainerProfileScreen middleContainers =
        new MiddleContainerProfileScreen();
    GainButtonProfileScreen gainButton = new GainButtonProfileScreen();
    BottomContainersProfileScreen bottomContainers =
        new BottomContainersProfileScreen();
    return Scaffold(
      key: Key('Scaffold_profile_screen'),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
              color: Theme.of(context).colorScheme.grayColor[100],
              child: topContainer.topContainer(context)),
          Container(
            height: SizeConfig.safeBlockVertical * 60,
            width: SizeConfig.safeBlockHorizontal * 100,
            color: Theme.of(context).colorScheme.grayColor[100],
            child: Column(
              children: <Widget>[
                middleContainers.middleContainers(context),
                gainButton.gainContainerButton(context),
                bottomContainers.bottomContainers(context),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
