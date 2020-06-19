import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileEditFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lastName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final cellPhone = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final email = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final id = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final scholarship = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final birthDate = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final profession = TextFieldBloc(validators: [FieldBlocValidators.required]);

  ProfileEditFormBloc() {
    addFieldBlocs(fieldBlocs: [
      name,
      lastName,
      cellPhone,
      email,
      id,
      scholarship,
      birthDate,
      profession
    ]);
  }

  @override
  void onSubmitting() async {
    print(name.value);
    print(cellPhone.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  Future<void> close() {
    name.close();
    lastName.close();
    cellPhone.close();
    email.close();
    id.close();
    scholarship.close();
    birthDate.close();
    profession.close();
    return super.close();
  }
}
