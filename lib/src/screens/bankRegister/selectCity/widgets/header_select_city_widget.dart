import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class HeaderSelectCityWidget extends StatelessWidget {
  const HeaderSelectCityWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return 
      Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
        child: Text(
          I18n.of(context).selectCityEnterSateCity,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        )
      );
  }
}
