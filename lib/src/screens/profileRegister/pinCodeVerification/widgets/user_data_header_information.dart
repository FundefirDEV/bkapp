import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/input_code.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/svg.dart';

class UserDataHeaderInformation extends StatelessWidget {
  final String tag;
  final String image;

  const UserDataHeaderInformation({Key key, this.tag, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        _headerContainer(context),
        InputCode(
          image: image,
          tag: tag,
        )
      ],
    );
  }

  Container _headerContainer(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              key: Key('user-data-header-information-container'),
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
    //ignore: close_sinks
    final profile = context.read<AppBloc>().profileRegisterBloc;
    String firstName = profile.nameBloc.firstName.value;
    String lastName = profile.nameBloc.secondName.value;

    return Container(
        key: Key('user-data-header-information-container-data'),
        width: SizeConfig.safeBlockHorizontal * 60,
        padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 10),
        child: Column(children: <Widget>[
          Container(
              key: Key('user-data-header-information-container-name'),
              alignment: Alignment.topLeft,
              child: Text(
                '$firstName $lastName',
                key: Key('user-data-header-information-text-name'),
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.grayColor,
                ),
              )),
          Container(
              key: Key('user-data-header-information-container-email'),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 0.5),
              child: Text('${profile.emailBloc.email.value}',
                  key: Key('user-data-header-information-text-email'),
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.grayColor))),
          Container(
              key: Key('user-data-header-information-container-phone'),
              alignment: Alignment.topLeft,
              child: Text('${profile.phoneBloc.phone.value}',
                  key: Key('user-data-header-information-text-phone'),
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.grayColor)))
        ]));
  }
}
