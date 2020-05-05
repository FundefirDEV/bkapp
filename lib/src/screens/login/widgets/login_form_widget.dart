import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';

import 'package:bkapp_flutter/core/bloc/loginFormBloc/login_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/card_buttons_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          return CardButtonsWidget(
            accept: context.bloc<LoginFormBloc>().submit,
            cancel: () => Navigator.pushNamed(context, introRoute),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFieldBlocBuilder(
                      key: Key('input-username'),
                      textFieldBloc: context.bloc<LoginFormBloc>().username,
                      errorBuilder: (context, string) =>
                        I18n.of(context).errorRequired,
                      decoration: InputDecoration(
                        labelText: I18n.of(context).formUser,
                        prefixIcon: Icon(Icons.account_circle))),
                  TextFieldBlocBuilder(
                      key: Key('input-password'),
                      textFieldBloc: context.bloc<LoginFormBloc>().password,
                      suffixButton: SuffixButton.obscureText,
                      errorBuilder: (context, string) =>
                        I18n.of(context).errorRequired,
                      decoration: InputDecoration(
                        labelText: I18n.of(context).formPassword,
                        prefixIcon: Icon(Icons.lock_open))),
                ],
              ),
            )
          );
        },
      ),
    );
  }
}
