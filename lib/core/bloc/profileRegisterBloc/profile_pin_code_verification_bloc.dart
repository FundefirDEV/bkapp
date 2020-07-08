import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfilePinCodeVerificationBloc extends FormBloc<String, String> {
  final pincode = TextFieldBloc(validators: [
    FieldBlocValidators.required,
  ]);

  ProfilePinCodeVerificationBloc() {
    addFieldBlocs(fieldBlocs: [pincode]);
  }

  @override
  void onSubmitting() async {
    try {
      print(pincode.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }

  Future<void> close() {
    pincode?.close();
    return super.close();
  }
}
