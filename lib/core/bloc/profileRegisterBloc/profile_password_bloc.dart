import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfilePasswordBloc extends FormBloc<String, String> {
  final password = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.passwordMin6Chars
  ]);

  final passwordConfirm = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.passwordMin6Chars
  ]);

  ProfilePasswordBloc() {
    addFieldBlocs(fieldBlocs: [password, passwordConfirm]);
  }

  @override
  void onSubmitting() async {
    try {
      print(password.value);
      print(passwordConfirm.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch(e) {
      emitFailure();
    }
  }

  Future<void> close() {
    password?.close();
    passwordConfirm?.close();
    return super.close();
  }
}
