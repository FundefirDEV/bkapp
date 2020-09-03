import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfilePhoneBloc extends FormBloc<String, String> {
  final ValidationCodeRepository repository;

  final phone = TextFieldBloc(validators: [
    UtilsTools.required,
    UtilsTools.minPhoneNumber,
  ]);

  final email = TextFieldBloc();
  final countryCode = TextFieldBloc();

  ProfilePhoneBloc({@required this.repository}) {
    addFieldBlocs(fieldBlocs: [phone, email]);
  }

  @override
  void onSubmitting() async {
    try {
      print(phone.value);
      print(email.value);
      var formatPhone = UtilsTools.removePhoneFormatter(phone.value);

      await repository.postValidationCode(
          phone: formatPhone, email: email.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }

  Future<void> close() {
    phone?.close();
    countryCode?.close();
    email?.close();
    return super.close();
  }
}
