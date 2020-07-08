import 'package:bkapp_flutter/environment_config.dart';
import 'package:flutter/material.dart';

import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/login/widgets/login_form_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 50,
                child: SvgPicture.asset('assets/images/oval.svg',
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SafeArea(
              child: _columnContent(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _columnContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              width: SizeConfig.safeBlockHorizontal * 35,
              child: Image.asset('assets/images/logo_bk.png')),
        ),
        Container(
            width: SizeConfig.safeBlockHorizontal * 85,
            child: LoginFormWidget(),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 20.0)
            ])),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(child: _finalText(context)),
          ),
        ),
        Text(
          EnvironmentConfig.ENV,
          style: TextStyle(color: Colors.white, fontSize: 10),
        )
      ],
    );
  }

  Widget _finalText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(
              text: I18n.of(context).loginScreenTextOne,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.0),
              children: <TextSpan>[
                TextSpan(
                    text: I18n.of(context).loginScreenTextTwo,
                    style: TextStyle(fontWeight: FontWeight.w700))
              ]),
        ),
        Container(
          margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
          height: 5.0,
          width: 50.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        )
      ],
    );
  }
}
