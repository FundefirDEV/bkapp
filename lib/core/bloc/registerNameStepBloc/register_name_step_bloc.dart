import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterNameStepBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final secondName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final email = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.email,
  ]);
  final phone = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final password = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.passwordMin6Chars
  ]);

  final passwordConfirm = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.passwordMin6Chars
  ]);

  RegisterNameStepBloc() {
    addFieldBlocs(fieldBlocs: [
      firstName,
      secondName,
      email,
      phone,
      password,
      passwordConfirm
    ]);
  }

  @override
  void onSubmitting() async {
    print(firstName.value);
    print(secondName.value);
    print(email.value);
    print(phone.value);
    print(password.value);
    print(passwordConfirm.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  void dispose() {
    firstName.close();
    secondName.close();
    email.close();
    phone.close();
    password.close();
    passwordConfirm.close();
  }
}
