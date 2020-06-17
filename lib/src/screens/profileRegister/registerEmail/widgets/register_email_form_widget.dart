import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterEmailFormWidget extends StatelessWidget {
  const RegisterEmailFormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final profile = context.bloc<AppBloc>().profileRegisterBloc;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 5,
          horizontal: SizeConfig.safeBlockHorizontal * 6),
      child: TextFieldBlocBuilder(
          textFieldBloc: profile.emailBloc.email,
          errorBuilder: (context, string) =>
              I18n.of(context).errorRequired,
          decoration:
              InputDecoration(labelText: I18n.of(context).formEmail)
      )
    );
  }
}
