import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterPasswordFormWidget extends StatelessWidget {
  const RegisterPasswordFormWidget({
    Key key,
    @required this.isValidating,
    @required this.validateSecondPassword
  }) : super(key: key);

  final Function isValidating;
  final Function validateSecondPassword;

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
                    onChanged: (value) =>
                      isValidating(value),
                    decoration: InputDecoration(
                        labelText: I18n.of(context).formPassword,
                        prefixIcon: Icon(Icons.person))),
                TextFieldBlocBuilder(
                    textFieldBloc: profilePassword.passwordBloc.passwordConfirm,
                    suffixButton: SuffixButton.obscureText,
                    errorBuilder: errorHandler,
                    onChanged: (value) =>
                      validateSecondPassword(value),
                    decoration: InputDecoration(
                        labelText: I18n.of(context).formConfirmPassword,
                        prefixIcon: Icon(Icons.person))),
              ],
            ),
          )),
    );
  }
}
