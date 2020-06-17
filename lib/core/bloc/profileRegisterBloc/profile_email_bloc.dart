import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileEmailBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.email,
  ]);

  ProfileEmailBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email
      ]
    );
  }

  @override
  void onSubmitting() async {
    try {
      print(email.value);

      await Future<void>.delayed(Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
    } catch(e) {
      emitFailure();
    }
  }

  Future<void> close() {
    email?.close();
    return super.close();
  }
}

