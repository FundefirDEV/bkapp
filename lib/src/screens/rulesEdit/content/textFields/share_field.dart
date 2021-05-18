import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ShareField extends StatelessWidget {
  const ShareField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
            key: Key('shares_textFields_rules_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc:
                  context.read<AppBloc>().rulesEditFormBloc.sharesValue,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelText: I18n.of(context).rulesScreenSharesValue,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )),
      ],
    );
  }
}