import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class PartnersAllowed extends StatelessWidget {
  const PartnersAllowed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
          fontWeight: FontWeight.w200,
          letterSpacing: 0.5
        ),
        children: <TextSpan>[
          TextSpan(
            text: I18n.of(context).bankRegisterAddPartnersMinimum
          ),
          TextSpan(
            text:  I18n.of(context).bankRegisterAddPartnersEight,
            style: TextStyle(
              fontWeight: FontWeight.w700
            )
          ),
          TextSpan(
            text:  I18n.of(context).bankRegisterAddPartnersTitle,
          )
        ]
      ),
    );
  }
}
