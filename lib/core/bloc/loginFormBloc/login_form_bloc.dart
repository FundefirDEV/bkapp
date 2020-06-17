import 'package:bkapp_flutter/core/bloc/loginFormBloc/authentication/authentication_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final LoginRepository repository;
  final AuthenticationBloc authenticationBloc;

  final username = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ]
  );
  final password = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  LoginFormBloc({
    @required this.repository,
    @required this.authenticationBloc
  }) {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password
      ]
    );
  }

  @override
  void onSubmitting() async {
    try {
      final token = await repository.postLogin(
        username: username.value,
        password: password.value
      );

      authenticationBloc.add(LoggedIn(token: token));
      emitSuccess(canSubmitAgain: true);
      clear();
    } catch (e) {
      emitFailure();
    }
  }

  void dispose() {
    username.close();
    password.close();
  }
}
