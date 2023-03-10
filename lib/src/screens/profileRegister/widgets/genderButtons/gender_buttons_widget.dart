import 'package:animate_do/animate_do.dart';
import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/register_name_step_screen.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../gender_image.dart';

Map<String, String> images = {
  'male': 'assets/images/man.svg',
  'female': 'assets/images/woman.svg',
  'other': 'assets/images/other.svg'
};

class GenderButtonsWidget extends StatelessWidget {
  const GenderButtonsWidget({Key key}) : super(key: key);

  void _selectGender(
      BuildContext context, String gender, ProfileRegisterBloc registerBloc) {
    registerBloc.genderBloc.gender.updateValue(gender);
    Navigator.pushNamed(context, registerNameUser,
        arguments: RegisterNameStepArgs(gender, images[gender]));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var registerBloc = context.read<AppBloc>().profileRegisterBloc;
    return Container(
      alignment: Alignment.center,
      width: SizeConfig.safeBlockHorizontal * 100,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: SizeConfig.safeBlockHorizontal * 15,
        runSpacing: SizeConfig.safeBlockHorizontal * 7,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: GenderImage(
                key: Key('genderImage-male'),
                tag: 'male',
                width: SizeConfig.safeBlockHorizontal * 30,
                genderTitle: I18n.of(context).genderScreenMan.toUpperCase(),
                image: SvgPicture.asset(images['male']),
                onTap: () => _selectGender(context, 'male', registerBloc)),
          ),
          FadeInRight(
            duration: Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 300),
            child: GenderImage(
                key: Key('genderImage-female'),
                tag: 'female',
                width: SizeConfig.safeBlockHorizontal * 30,
                genderTitle: I18n.of(context).genderScreenWoman.toUpperCase(),
                image: SvgPicture.asset(images['female']),
                onTap: () => _selectGender(context, 'female', registerBloc)),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 400),
            child: GenderImage(
                key: Key('genderImage-other'),
                tag: 'other',
                width: SizeConfig.safeBlockHorizontal * 30,
                genderTitle: I18n.of(context).genderScreenOther.toUpperCase(),
                image: SvgPicture.asset(images['other']),
                onTap: () => _selectGender(context, 'other', registerBloc)),
          ),
        ],
      ),
    );
  }
}
