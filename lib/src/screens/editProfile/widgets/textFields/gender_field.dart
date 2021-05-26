import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class GenderFields extends StatelessWidget {
  const GenderFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
            //key: Key('fund_textFields_rules_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc:
                  context.read<AppBloc>().profileEditFormBloc.gender,
              keyboardType: TextInputType.text,
             
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelText: "Gender",
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )
          ),
        ],
      ),
    );
  }
}
