import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class HeaderCountry extends StatelessWidget {
  const HeaderCountry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return 
      Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
        child: Text(
          I18n.of(context).selectCountryWhereAreYouFrom,
          style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor,
            fontSize: 20
          ),
        )
      );
  }
}
