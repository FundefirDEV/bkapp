import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';
class SchollarshipAndProfession extends StatelessWidget {
  const SchollarshipAndProfession({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Row(key: Key('Row_textFields_profile_edit_screen'), children: <Widget>[
          SvgPicture.asset('assets/images/collage.svg'),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 35,
          )
        ]),
        Container(
            key: Key('scholarship_textFields_profile_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc:
                  context.bloc<AppBloc>().profileEditFormBloc.scholarship,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelText: I18n.of(context).profileScreenScholarship,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )),
        Container(
            key: Key('profession_textFields_profile_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc:
                  context.bloc<AppBloc>().profileEditFormBloc.profession,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelText: I18n.of(context).profileScreenProfession,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )),
      ],
    );
  }
}

class IdAndBirthdateTextField extends StatelessWidget {
  const IdAndBirthdateTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Row(key: Key('Row_textFields_profile_edit_screen'), children: <Widget>[
          SvgPicture.asset('assets/images/user_icon_profile.svg'),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 35,
          )
        ]),
        Container(
            key: Key('id_textFields_profile_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc: context.bloc<AppBloc>().profileEditFormBloc.id,
              style: TextStyle(fontSize: 12),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  labelText: I18n.of(context).profileScreenId,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )),
        Container(
            key: Key('birthDate_textFields_profile_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc:
                  context.bloc<AppBloc>().profileEditFormBloc.birthDate,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelText: I18n.of(context).profileScreenBirthDate,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )),
      ],
    );
  }
}

class NameAndCellphone extends StatelessWidget {
  const NameAndCellphone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              key: Key('name_textFields_profile_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc: context.bloc<AppBloc>().profileEditFormBloc.name,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                    labelText: I18n.of(context).formFirstName,
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              )),
          Container(
              key: Key('cellphone_textFields_profile_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.bloc<AppBloc>().profileEditFormBloc.cellPhone,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    prefixIcon: SvgPicture.asset(
                  'assets/images/colombia_profile.svg',
                )),
              ))
        ],
      ),
    );
  }
}

class LastNameAndEmail extends StatelessWidget {
  const LastNameAndEmail({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              key: Key('LastName_textFields_profile_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.bloc<AppBloc>().profileEditFormBloc.lastName,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  labelText: I18n.of(context).profileEditScreenLastName,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              )),
          Container(
              key: Key('Email_textFields_profile_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.bloc<AppBloc>().profileEditFormBloc.email,
                style: TextStyle(fontSize: 12),
              ))
        ],
      ),
    );
  }
}
