import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/rules/content/top_container_content_rules_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TopContainerEditRulesScreen extends StatelessWidget {
  const TopContainerEditRulesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      key: Key('top_container_rules_edit_Screen'),
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
        key: Key('top_container_column_rules_edit_Screen'),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TopContainerContentRulesScreen().saloAndArrow(),
          TopContainerContentRulesScreen().titleAndArrow(context),
          topContainerInformation(),
          Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
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
      key: Key('top_container_info_rules_edit_Screen'),
      height: SizeConfig.safeBlockVertical * 15.5,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Image.asset('assets/images/logo_bk.png')),
    );
  }
}
