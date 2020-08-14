import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/core/services/repositories/profile_register_repository.dart';
import 'package:bkapp_flutter/src/utils/errorHandler/constans_error.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:logger/logger.dart';

class ProfileRegisterBloc extends FormBloc<String, String> {
  final ProfileRegisterRepository repository;
  // ignore: close_sinks
  final inputTest = TextFieldBloc();

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

  ProfileNameBloc _nameBloc;
  ProfileEmailBloc _emailBloc;
  ProfilePhoneBloc _phoneBloc;
  ProfilePinCodeVerificationBloc _profilePinCodeVerificationBloc;

  ProfileRegisterBloc({@required this.repository})
      : _nameBloc = ProfileNameBloc(),
        _emailBloc = ProfileEmailBloc(),
        _phoneBloc = ProfilePhoneBloc(repository: validationCodeRepository),
        _profilePinCodeVerificationBloc = ProfilePinCodeVerificationBloc(
            repository: validationCodeConfirmRepository) {
    addFieldBlocs(fieldBlocs: [inputTest, password, passwordConfirm]);
    passwordConfirm
      ..addValidators([_confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
  }

  ProfileNameBloc get nameBloc => _nameBloc;
  ProfileEmailBloc get emailBloc => _emailBloc;
  ProfilePhoneBloc get phoneBloc => _phoneBloc;
  ProfilePinCodeVerificationBloc get pinCodeBloc =>
      _profilePinCodeVerificationBloc;

  var logger = Logger(
      printer: PrettyPrinter(
    colors: false,
    errorMethodCount: 1,
    printEmojis: true,
    printTime: true,
    lineLength: 80,
    methodCount: 0,
  ));

  @override
  void onSubmitting() async {
    try {
      print(password.value);
      print(passwordConfirm.value);

      logger.v({
        'firstValue': '${_nameBloc.firstName.value}',
        'email': '${_emailBloc.email.value}',
        'phone': '${_phoneBloc.phone.value.replaceAll(new RegExp(r'\W'), '')}',
        'password': '${password.value}',
        'confirm-password': '${passwordConfirm.value}',
        'pinCode': '${_profilePinCodeVerificationBloc.pincode.value}'
      });

      final response = await repository.registerUser(new PartnerModel(
          password: password.value,
          passwordConfirmation: passwordConfirm.value,
          validationCode: _profilePinCodeVerificationBloc.pincode.value,
          firstname: _nameBloc.firstName.value,
          lastname: _nameBloc.secondName.value,
          gender: 'M',
          country: 1,
          phone: _phoneBloc.phone.value.replaceAll(new RegExp(r'\W'), ''),
          email: _emailBloc.email.value));

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
