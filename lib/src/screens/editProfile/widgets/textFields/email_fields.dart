import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class EmailAndPhoneFields extends StatelessWidget {
  const EmailAndPhoneFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final profileEditFormBloc = context.read<AppBloc>().profileEditFormBloc;

    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              key: Key('maxCredit_textFields_rules_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 80,
              margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
              child: TextFieldBlocBuilder(
                textFieldBloc: profileEditFormBloc.email,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              )),
          Container(
              key: Key('maxDues_textFields_rules_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 80,
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                     blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
              child: TextFieldBlocBuilder(
                textFieldBloc: profileEditFormBloc.cellPhone,
                keyboardType: TextInputType.phone,
                
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ))
        ],
      ),
    );
  }
}
