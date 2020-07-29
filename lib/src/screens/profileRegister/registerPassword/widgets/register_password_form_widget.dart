import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterPasswordFormWidget extends StatelessWidget {
  const RegisterPasswordFormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final profilePassword = context.bloc<AppBloc>().profileRegisterBloc;

    return Material(
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 6),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFieldBlocBuilder(
                    textFieldBloc: profilePassword.passwordBloc.password,
                    suffixButton: SuffixButton.obscureText,
                    errorBuilder: errorHandler,
                    decoration: InputDecoration(
                        labelText: I18n.of(context).formPassword,
                        prefixIcon: Icon(Icons.person))),
                TextFieldBlocBuilder(
                    textFieldBloc: profilePassword.passwordBloc.passwordConfirm,
                    suffixButton: SuffixButton.obscureText,
                    errorBuilder: errorHandler,
                    decoration: InputDecoration(
                        labelText: I18n.of(context).formConfirmPassword,
                        prefixIcon: Icon(Icons.person))),
              ],
            ),
          )),
    );
  }
}
