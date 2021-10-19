import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/admin_create_bank_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankFormBloc extends FormBloc<dynamic, dynamic> {
  AdminCreateBankFormBloc({@required this.repository}) {
    addFieldBlocs(
        fieldBlocs: [bankName, countryList, cityList, departamentList]);
  }

  final AdminCreateBankRepository repository;

  final countryList = SelectFieldBloc<DropDownModel, String>(
      items: [DropDownModel(id: 'CO', text: 'colombia')]);
  final departamentList = SelectFieldBloc<DropDownModel, String>(
      items: [DropDownModel(id: '1', text: 'cundinadarca')]);
  final cityList = SelectFieldBloc<DropDownModel, String>(
      items: [DropDownModel(id: '1', text: 'bogotá')]);
  final bankName = TextFieldBloc();
  final List<AdminCreateBankUser> userList = [];
  final firstName = TextFieldBloc();
  final lastName = TextFieldBloc();
  final phone = TextFieldBloc();
  final email = TextFieldBloc();
  final documenNumber = TextFieldBloc();

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }

  Future<void> close() {
    return super.close();
  }
}
