import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/register_phone_form_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPhoneContainerWidget extends StatelessWidget {
  final String tag;
  final String image;

  const RegisterPhoneContainerWidget({Key key, this.tag, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _headerContainer(context),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 3,
              vertical: SizeConfig.safeBlockVertical * 2,
            ),
            child: Column(children: <Widget>[
              RegisterPhoneFormWidget(),
              Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockVertical * 4,
                  ),
                  child: Column(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              text: I18n.of(context).registerPhoneTextOne,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w200,
                                color: Colors.black54,
                              ),
                              children: <TextSpan>[
                            TextSpan(
                              text: I18n.of(context).registerPhoneTextTwo,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                                text: I18n.of(context).registerPhoneTextThree,
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black54,
                                ))
                          ])),
                      RichText(
                          text: TextSpan(
                              text: I18n.of(context).registerPhoneTextFour,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w200,
                                color: Colors.black54,
                              ),
                              children: <TextSpan>[
                            TextSpan(
                              text: I18n.of(context).registerPhoneTextFive,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )
                          ])),
                    ],
                  ))
            ]))
      ],
    );
  }

  Container _headerContainer(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 5,
                  vertical: SizeConfig.safeBlockVertical * 2),
              width: SizeConfig.safeBlockHorizontal * 40,
              child: GenderImage(
                width: SizeConfig.safeBlockHorizontal * 20,
                image: SvgPicture.asset(this.image),
                tag: this.tag,
              )),
          _infoUser(context)
        ],
      ),
    );
  }

  Container _infoUser(BuildContext context) {
    return Container(
        width: SizeConfig.safeBlockHorizontal * 60,
        padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 10),
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Marcos Nope',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 0.5),
              child: Text('data.code.trip@gmail.com',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ))),
          Container(
              alignment: Alignment.topLeft,
              child: Text(I18n.of(context).registerPhoneTitle,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  )))
        ]));
  }
}
