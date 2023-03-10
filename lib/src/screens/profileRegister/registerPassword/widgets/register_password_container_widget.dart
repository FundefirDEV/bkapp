import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/widgets/register_password_form_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPasswordContainerWidget extends StatelessWidget {
  const RegisterPasswordContainerWidget(
      {Key key,
      this.tag,
      this.image,
      this.isValidating,
      this.validateSecondPassword})
      : super(key: key);

  final String tag;
  final String image;
  final Function isValidating;
  final Function validateSecondPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _headerContainer(context),
        Container(
            child: RegisterPasswordFormWidget(
          isValidating: isValidating,
          validateSecondPassword: validateSecondPassword,
        ))
      ],
    );
  }

  Container _headerContainer(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
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
    //ignore: close_sinks
    final profile = context.read<AppBloc>().profileRegisterBloc;
    String firstName = profile.nameBloc.firstName.value;
    String lastName = profile.nameBloc.secondName.value;

    return Container(
        width: SizeConfig.safeBlockHorizontal * 60,
        padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 10),
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                '$firstName $lastName',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.grayColor,
                ),
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 0.5),
              child: Text('${profile.emailBloc.email.value}',
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.grayColor))),
          Container(
              alignment: Alignment.topLeft,
              child: Text('${profile.phoneBloc.phone.value}',
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.grayColor)))
        ]));
  }
}
