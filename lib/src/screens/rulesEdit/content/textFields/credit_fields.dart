import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreditFields extends StatelessWidget {
  const CreditFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              key: Key('maxCredit_textFields_rules_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.read<AppBloc>().rulesEditFormBloc.creditMaxInstallments,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                    labelText: I18n.of(context).rulesScreenMaxValue +
                        " " +
                        I18n.of(context).rulesScreenCredit,
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              )),
          Container(
              key: Key('maxDues_textFields_rules_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.read<AppBloc>().rulesEditFormBloc.creditMaxValue,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    labelText: I18n.of(context).rulesScreenMaxDues,
                    labelStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ))
        ],
      ),
    );
  }
}
