import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class NamesFields extends StatelessWidget {
  const NamesFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileEditFormBloc = context.read<AppBloc>().profileEditFormBloc;

    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              width: SizeConfig.blockSizeHorizontal * 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                  )
                ]),
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    profileEditFormBloc.firstname,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  labelText: "Firts name",
                  labelStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              )),
          Container(
              width: SizeConfig.blockSizeHorizontal * 60,
              margin: EdgeInsets.only(top: 20) ,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                  )
                ]),
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    profileEditFormBloc.lastName,
                keyboardType: TextInputType.text,
               
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    labelText: "Last name",
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ))
        ],
      ),
    );
  }
}
