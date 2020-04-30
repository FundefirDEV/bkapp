import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/userFllInfo/widgets/registerName/widgets/register_name_form_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterNameStepWidget extends StatelessWidget {
  const RegisterNameStepWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(children: <Widget>[
      Container(
          width: SizeConfig.safeBlockHorizontal * 50,
          child: Text(
            I18n.of(context).registerNameTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          )),
      Container(
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 4),
          child: SvgPicture.asset('assets/images/man.svg')),
      Container(child: RegisterNameFormWidget())
    ]);
  }
}
