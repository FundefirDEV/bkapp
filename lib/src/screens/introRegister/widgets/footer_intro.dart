import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FooterIntro extends StatelessWidget {
  const FooterIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: SizeConfig.safeBlockHorizontal * 1,
          width: SizeConfig.safeBlockHorizontal * 15,
          margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black26
          ),
        ),
        Container(
            width: SizeConfig.blockSizeHorizontal * 60,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              I18n.of(context).introScreenFinancialLife,
              style: TextStyle(color: Colors.white, fontSize: SizeConfig.blockSizeHorizontal * 4),
              textAlign: TextAlign.center,
            )
          )
        ],
      ),
    );
  }
}