import 'package:bkapp_flutter/src/utils/errorHandler/constans_error.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfilePasswordBloc extends FormBloc<String, String> {
  final password = TextFieldBloc(
      validators: [UtilsTools.required, FieldBlocValidators.passwordMin6Chars]);

  final passwordConfirm = TextFieldBloc(
      validators: [UtilsTools.required, FieldBlocValidators.passwordMin6Chars]);

  Validator<String> _confirmPassword(TextFieldBloc passwordTextField) {
    return (String passwordConfirm) {
      return passwordConfirm == passwordTextField.value
          ? null
          : differentPasswords;
    };
  }

  ProfilePasswordBloc() {
    addFieldBlocs(fieldBlocs: [password, passwordConfirm]);
    passwordConfirm
      ..addValidators([_confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
  }

  @override
  void onSubmitting() async {
    try {
      print(password.value);
      print(passwordConfirm.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }

  Future<void> close() {
    password?.close();
    passwordConfirm?.close();
    return super.close();
  }
}
