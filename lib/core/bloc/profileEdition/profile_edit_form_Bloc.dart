import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/core/models/update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:async';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

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


  final _errorMessageController  = BehaviorSubject<String>();
  Stream<String> get errorMessageStream => _errorMessageController.stream;
  String get errorMessage => _errorMessageController.value;

  final _loadingController  = BehaviorSubject<bool>();
  Stream<bool> get loadingStream => _loadingController.stream;
  bool get loading => _loadingController.value;

  // final scholarship = TextFieldBloc(validators: [FieldBlocValidators.required]);
  // final birthDate = TextFieldBloc(validators: [FieldBlocValidators.required]);
  // final profession = TextFieldBloc(validators: [FieldBlocValidators.required]);

  bool validateForm(){

    final valid = FieldBlocValidators.email(email.value) == null
    && FieldBlocValidators.required(email.value) == null
    && FieldBlocValidators.required(cellPhone.value) == null
    && FieldBlocValidators.required(firstname.value) == null
    && FieldBlocValidators.required(lastName.value) == null;
  
    return valid;
  }

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

  void getProfileData(ProfileModel profile){
    
    firstname.updateInitialValue(profile.firstname);
    lastName.updateInitialValue(profile.lastname);
    email.updateInitialValue(profile.email);
    cellPhone.updateInitialValue(profile.phone);

  }

  @override
  Future<bool> submit() async {


    if(!validateForm()){
      return false;
    }



    if(token.value.isEmpty){
      print( 'invalid token, token is null' );
      return false;
    }

    _loadingController.sink.add(true);

    final updatePeofile = UpdatePeofile(
      firstname: firstname.value,
      lastname: lastName.value,
      phone: cellPhone.value,
      email: email.value,
      gender: 'Gender.m'
    );

    try {

      await repository.updateProfile(updatePeofile , token.value);
      _loadingController.sink.add(false);
      _errorMessageController.add('');

      return true;

    } catch (e) {

      print(e);
        if(e.toString().contains('A user already owns that email or phone')){
          _errorMessageController.sink.add('A user already owns that email or phone');
      }
      _loadingController.sink.add(false);
      return false;
    }
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
    _errorMessageController.close();
    _loadingController.close();
    return super.close();
  }
}
