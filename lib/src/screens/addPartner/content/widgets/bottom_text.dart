import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('container-botom-text-add-partner-screen'),
      // margin: EdgeInsets.only(
      //   top: SizeConfig.blockSizeVertical ,
      //   bottom: SizeConfig.blockSizeVertical ,
      // ),
      child: RichText(
          key: Key('botom-text-add-partner-screen'),
          textAlign: TextAlign.center,
          text: TextSpan(
              text:  I18n.of(context).addPartnerBottomText + '\n ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1),
              children: <TextSpan>[
                TextSpan(
                  text:  I18n.of(context).addPartnerAnyTime,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1,
                  ),
                )
              ])),
    );
  }
}
