import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterEmailFormWidget extends StatelessWidget {
  const RegisterEmailFormWidget({
    Key key,
    this.isValidating
  }) : super(key: key);

  final Function isValidating;

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final profile = context.bloc<AppBloc>().profileRegisterBloc;
    return Material(
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical * 5,
              horizontal: SizeConfig.safeBlockHorizontal * 6),
          child: TextFieldBlocBuilder(
            key: Key('text-field-email-profile-register'),
            textFieldBloc: profile.emailBloc.email,
            errorBuilder: errorHandler,
            onChanged: (value) => isValidating(profile.emailBloc),
            decoration:
                InputDecoration(labelText: I18n.of(context).formEmail))),
    );
  }
}
