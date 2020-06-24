import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:logger/logger.dart';

class ProfileRegisterBloc extends FormBloc<String, String>{
  ProfileNameBloc _nameBloc;
  ProfileEmailBloc _emailBloc;
  ProfilePhoneBloc _phoneBloc;
  ProfilePasswordBloc _passwordBloc;
  
  final inputTest = TextFieldBloc();

  ProfileRegisterBloc()
    : _nameBloc     = ProfileNameBloc(),
      _emailBloc    = ProfileEmailBloc(),
      _phoneBloc    = ProfilePhoneBloc(),
      _passwordBloc = ProfilePasswordBloc() {
    addFieldBlocs(fieldBlocs: [inputTest]);
  }

  ProfileNameBloc get nameBloc         => _nameBloc;
  ProfileEmailBloc get emailBloc       => _emailBloc;
  ProfilePhoneBloc get phoneBloc       => _phoneBloc;
  ProfilePasswordBloc get passwordBloc => _passwordBloc;

  var logger = Logger(
    printer: PrettyPrinter(
      colors: false,
      errorMethodCount: 1,
      printEmojis: true,
      printTime: true,
      lineLength: 80,
      methodCount: 0,
    )
  );

  @override
  void onSubmitting() {
    try {
      logger.v({
        'firstValue': '${_nameBloc.firstName.value}',
        'email': '${_emailBloc.email.value}',
        'phone': '${_phoneBloc.phone.value}',
        'password': '${_passwordBloc.password.value}'
      });
      emitSuccess();
    } catch(e) {
      emitFailure();
    }
  }

  Future<void> close() {
    inputTest?.close();
    return super.close();
  }
}
