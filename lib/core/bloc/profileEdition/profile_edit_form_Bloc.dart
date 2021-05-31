import 'package:bkapp_flutter/core/models/update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:async';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';

class ProfileEditFormBloc extends FormBloc<String, String> {

  final token = TextFieldBloc();
  final ProfileEditRepository repository;

  final errorMessage = TextFieldBloc(initialValue: 'error mensaje');

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
    ],);
  }

  @override
  Future<bool> submit() async {

    final updatePeofile = UpdatePeofile(
      firstname: firstname.value,
      lastname: lastName.value,
      phone: cellPhone.value,
      email: email.value,
      gender: gender.value
    );

    if(token.value.isEmpty){
      print( 'invalid token, token is null' );
      return false;
    }

    try {

      await repository.updateProfile(updatePeofile , token.value);
      return true;

    } catch (e) {

      print(e);
        if(e.toString().contains('A user already owns that email or phone')){
          errorMessage.updateValue('A user already owns that email or phone');
      }
      return false;
    }
    //super.submit();
  }

  @override
  void onSubmitting() async {
    
    emitSuccess(canSubmitAgain: false);
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
