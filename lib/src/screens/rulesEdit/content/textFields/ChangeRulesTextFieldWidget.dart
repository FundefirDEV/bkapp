import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ChangeRulesTextFieldWidget extends StatelessWidget {
  const ChangeRulesTextFieldWidget({
    Key key,
    @required TextFieldBloc<dynamic> this.textFieldBloc,
    @required String this.title,
    @required TextInputType this.textInputType,
  });

  final textFieldBloc;
  final title;
  final textInputType;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          key: Key('payment_textFields_rules_edit_screen'),
          width: SizeConfig.blockSizeHorizontal * 40,
          child: TextFieldBlocBuilder(
            textFieldBloc: textFieldBloc,
            style: TextStyle(fontSize: 12),
            keyboardType: textInputType,
            decoration: InputDecoration(
              labelText: title,
              labelStyle:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          )
        ),
      ],
    );
  }
}
