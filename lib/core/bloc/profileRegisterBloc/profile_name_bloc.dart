import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileNameBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final secondName = TextFieldBloc(validators: [FieldBlocValidators.required]);

  ProfileNameBloc() {
    addFieldBlocs(fieldBlocs: [firstName, secondName]);
  }

  @override
  void onSubmitting() async {
    try {
      print(firstName.value);
      print(secondName.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch(e) {
      emitFailure();
    }
  }

  Future<void> close() {
    firstName.close();
    secondName.close();
    return super.close();
  }
}
