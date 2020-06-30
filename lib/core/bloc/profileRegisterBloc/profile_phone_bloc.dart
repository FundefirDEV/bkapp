import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfilePhoneBloc extends FormBloc<String, String> {
  final phone = TextFieldBloc(validators: [
    UtilsTools.required,
    UtilsTools.minPhoneNumber,
  ]);

  ProfilePhoneBloc() {
    addFieldBlocs(fieldBlocs: [phone]);
  }

  @override
  void onSubmitting() async {
    try {
      print(phone.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch(e) {
      emitFailure();
    }
  }

  Future<void> close() {
    phone?.close();
    return super.close();
  }
}
