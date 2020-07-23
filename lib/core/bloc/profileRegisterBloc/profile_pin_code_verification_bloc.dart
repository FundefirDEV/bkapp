import 'package:bkapp_flutter/core/services/repositories/validation_code_confirm_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfilePinCodeVerificationBloc extends FormBloc<String, String> {
  final ValidationCodeConfirmRepository repository;

  final pincode = TextFieldBloc(validators: [
    FieldBlocValidators.required,
  ]);

  final email = TextFieldBloc();
  final phone = TextFieldBloc();

  ProfilePinCodeVerificationBloc({@required this.repository}) {
    addFieldBlocs(fieldBlocs: [pincode, email, phone]);
  }

  @override
  void onSubmitting() async {
    try {
      var formatPhone = UtilsTools.removePhoneFormatter(phone.value);

      await repository.postValidationCodeConfirm(
          code: pincode.value, phone: formatPhone, email: email.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }

  Future<void> close() {
    pincode?.close();
    email?.close();
    phone?.close();
    return super.close();
  }
}
