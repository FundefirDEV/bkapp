import 'package:bkapp_flutter/core/models/update_profile_model.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profile_repository.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileEditFormBloc extends FormBloc<String, String> {

  final ProfileRepository repository;

  final firstname = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lastName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final cellPhone = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final email = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.email
  ]);
  final gender = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // final scholarship = TextFieldBloc(validators: [FieldBlocValidators.required]);
  // final birthDate = TextFieldBloc(validators: [FieldBlocValidators.required]);
  // final profession = TextFieldBloc(validators: [FieldBlocValidators.required]);

  ProfileEditFormBloc({@required this.repository}) {
    addFieldBlocs(fieldBlocs: [
      firstname,
      lastName,
      cellPhone,
      email,
      gender,
      // scholarship,
      // birthDate,
      // profession
    ]);
  }

  @override
  void onSubmitting() async {

    print(firstname.value);
    print(lastName.value);
    print(cellPhone.value);
    print(email.value);   
    print(gender.value);

    final updatePeofile = UpdatePeofile(
      firstname: firstname.value,
      lastname: lastName.value,
      phone: cellPhone.value,
      email: email.value,
      gender: gender.value
    );

    try {
      
      final res = await profileRepository.updateProfile(updatePeofile);

      emitSuccess(canSubmitAgain: true);

      //Navigator.of(context).pushNamed(profileScreen);
      
    } catch (e) {
      
      print(e);
    }

  }

  Future<void> close() {
    firstname.close();
    lastName.close();
    cellPhone.close();
    email.close();
    gender.close();
    // id.close();
    // scholarship.close();
    // birthDate.close();
    // profession.close();
    return super.close();
  }
}
