import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final LoginRepository repository;

  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );
  final password = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  LoginFormBloc({@required this.repository}) {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password
      ]
    );
  }

  @override
  void onSubmitting() async {
    await repository.postLogin(
      username: username.value,
      password: password.value
    );
    emitSuccess();
  }

  void dispose() {
    username.close();
    password.close();
  }
}
