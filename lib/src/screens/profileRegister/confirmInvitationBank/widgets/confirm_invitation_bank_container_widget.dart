import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmInvitationBankContainerWidget extends StatelessWidget {
  final String tag;
  final String image;

  const ConfirmInvitationBankContainerWidget({Key key, this.tag, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = context.bloc<AppBloc>().profileRegisterBloc;
    return Column(
      children: <Widget>[
        _headerContainer(context, profile),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 4,
            ),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: I18n.of(context).confimInvitationBankDescription,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.grayColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: I18n.of(context).appName,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ])))
      ],
    );
  }

  Container _headerContainer(
      BuildContext context, ProfileRegisterBloc profile) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 8),
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
          _infoUser(context, profile)
        ],
      ),
    );
  }

  Container _infoUser(BuildContext context, ProfileRegisterBloc profile) {
    String firstName = profile.nameBloc.firstName.value;
    String lastName = profile.nameBloc.secondName.value;
    return Container(
        width: SizeConfig.safeBlockHorizontal * 60,
        padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 10),
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text('$firstName $lastName',
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 6,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.grayColor))),
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
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).colorScheme.grayColor,
                  ))),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
              child: Text('********',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).colorScheme.grayColor,
                  )))
        ]));
  }
}
