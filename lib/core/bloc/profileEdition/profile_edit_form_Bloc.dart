import 'package:bkapp_flutter/core/models/update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:async';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'bloc/profile_edit_Bloc.dart';

class ProfileEditFormBloc extends FormBloc<String, String> {

  final token = TextFieldBloc();
  final ProfileEditRepository repository;

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
  void submit() async {

    print('summiit!');
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

    if(token.value.isEmpty){
      print( 'invalid token' );
      return;
    }

    print( token.value );
    
    final res = await repository.updateProfile(updatePeofile , token.value);
    print(res);

    super.submit();
  }

  // void onsumit(BuildContext context) async {
  //   print(firstname.value);
  //   print(lastName.value);
  //   print(cellPhone.value);
  //   print(email.value);   
  //   print(gender.value);

  //   final updatePeofile = UpdatePeofile(
  //     firstname: firstname.value,
  //     lastname: lastName.value,
  //     phone: cellPhone.value,
  //     email: email.value,
  //     gender: gender.value
  //   );

  //   try {
      
  //     final res = await profileRepository.updateProfile(updatePeofile);

  //     print(res);

  //     Navigator.pop(context);
      
  //   } catch (e) {
      
  //     print(e);
  //   }
  // }

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
