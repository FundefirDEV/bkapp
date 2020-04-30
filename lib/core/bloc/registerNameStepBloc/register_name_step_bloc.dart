import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterNameStepBloc extends FormBloc<String, String> {

  final firstName = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );
  final secondName = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  RegisterNameStepBloc() {
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        secondName
      ]
    );
  }

  @override
  void onSubmitting() async {
    print(firstName.value);
    print(secondName.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  void dispose() {
    firstName.close();
    secondName.close();
  }
}
