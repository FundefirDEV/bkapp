import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/core/models/update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:async';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

import 'data_edit_profile.dart';

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

  final _birthDateController  = BehaviorSubject<String>();
  Stream<String> get birthDateStream => _birthDateController.stream;
  String get birthDate => _birthDateController.value;

  void updateBirdate(String birthdate){
    _birthDateController.sink.add(birthdate);
  }

  String birthDateFormat(){

    if(birthDate != 'no data') 
      return DateFormat.yMMMd().format(DateTime.parse(birthDate));
    
    return birthDate;
  }


  final scholarship = SelectFieldBloc(items: ['']);
  final profession = TextFieldBloc();
  final documentNumber = TextFieldBloc();

  bool validateForm(){

    final valid = FieldBlocValidators.email(email.value) == null
    && FieldBlocValidators.required(email.value) == null
    && FieldBlocValidators.required(cellPhone.value) == null
    && FieldBlocValidators.required(firstname.value) == null
    && FieldBlocValidators.required(documentNumber.value) == null;
    // && FieldBlocValidators.required(scholarship.value) == null
    // && FieldBlocValidators.required(profession.value) == null
    // && FieldBlocValidators.required(birthDate.value) == null
    // && FieldBlocValidators.required(lastName.value) == null;
  
    return valid;
  }

  ProfileEditFormBloc({@required this.repository}) {

    scholarship.updateItems(scholarshipType);

    addFieldBlocs(fieldBlocs: [
      firstname,
      lastName,
      cellPhone,
      email,
      gender,
      profession,
      documentNumber,
    ],);

  addFieldBlocs(fieldBlocs: [scholarship]);
}

  void getProfileData(ProfileModel profile){
    
    firstname.updateInitialValue(profile.firstname);
    lastName.updateInitialValue(profile.lastname);
    email.updateInitialValue(profile.email);
    cellPhone.updateInitialValue(profile.phone);
    documentNumber.updateInitialValue(profile.documentNumber);
    profession.updateInitialValue(profile.profession);

    _birthDateController.sink.add(profile.birthDate);

    //scholarship.updateInitialValue(profile.scholarship.toString());
  }

  void attachError(String error){
    if(error.toUpperCase().contains('EMAIL')){
        _errorMessageController.sink.add('A email already used');
    } else if(error.toUpperCase().contains('PHONE')){
        _errorMessageController.sink.add('A phone already used');
    } else {
      _errorMessageController.sink.add(error);
    }
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
      gender: 'Gender.m',
      documentNumber: documentNumber.value,
      scholarship: scholarshipType.indexOf(scholarship.value) != -1 ? 
      scholarshipType.indexOf(scholarship.value) : null,
      birthDate: birthDate,
      profession: profession.value,
    );

    try {
      print(scholarship.value);
      print(scholarshipType.indexOf(scholarship.value));
      await repository.updateProfile(updatePeofile , token.value);
      _loadingController.sink.add(false);
      _errorMessageController.add('');

      return true;

    } catch (e) {

      print(e);
      attachError(e.toString());
     
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
    scholarship.close();
    profession.close();
    documentNumber.close();
    _errorMessageController.close();
    _loadingController.close();
    _birthDateController.close();

    return super.close();
  }
}
