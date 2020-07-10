import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/rules/content/top_container_content_rules_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class TopContainerRulesSceen extends StatelessWidget {
  const TopContainerRulesSceen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('top_container_rules_screen'),
      height: SizeConfig.safeBlockVertical * 38,
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
          TopContainerContentRulesScreen().saloAndArrow(),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1.3,
          ),
          TopContainerContentRulesScreen().titleAndArrow(context),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1.3,
          ),
          topContainerInformation(context),
          Container(
              height: SizeConfig.safeBlockVertical * 4,
              child: FlatButton(
                  key: Key('edit_button_rules_screen'),
                  onPressed: () =>
                      Navigator.pushNamed(context, rulesEditScreen),
                  child: Text(
                    I18n.of(context).profileScreenEdit,
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }

  Container topContainerInformation(context) {
    return Container(
      key: Key('top_container_information_rules_Screen'),
      height: SizeConfig.safeBlockVertical * 17,
      child: Row(
        key: Key('row_top_container_rules_Screen'),
        children: <Widget>[
          Container(
              key: Key('top_container_information_rules_Screen'),
              margin: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 15,
                right: SizeConfig.safeBlockHorizontal * 4,
                bottom: SizeConfig.safeBlockHorizontal * 5,
              ),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child: Image.asset('assets/images/logo_bk.png'))),
          Column(
            key: Key('text_column_top_container_rules_sreen'),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    richTextBuild(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SvgPicture.asset('assets/images/colombia_profile.svg'),
                        Text(
                          'Bogotá',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  RichText richTextBuild(context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
          text: 'Fundefir BK' '\n',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: I18n.of(context).rulesScreenCreationDate,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: '12/10/2020',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}
