import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InterestsFields extends StatelessWidget {
  const InterestsFields({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
      child: Column(
        children: <Widget>[
          Container(
              key: Key('ordinaryInterest_textFields_rules_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.read<AppBloc>().rulesEditFormBloc.ordinaryInterestPercentage,
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: I18n.of(context).rulesScreenOrdinaryInterest,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              )),
          Container(
              key: Key('defaultInterest_textFields_rules_edit_screen'),
              width: SizeConfig.blockSizeHorizontal * 40,
              child: TextFieldBlocBuilder(
                textFieldBloc:
                    context.read<AppBloc>().rulesEditFormBloc.defaultRatePercentage,
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: I18n.of(context).rulesScreenDefaultInterest,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ))
        ],
      ),
    );
  }
}
