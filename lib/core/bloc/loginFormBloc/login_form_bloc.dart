import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {

  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );
  final password = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password
      ]
    );
  }

  @override
  void onSubmitting() async {
    print(username.value);
    print(password.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  void dispose() {
    username.close();
    password.close();
  }
}
