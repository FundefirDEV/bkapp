import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/admin_create_bank_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankFormBloc extends FormBloc<dynamic, dynamic> {
  AdminCreateBankFormBloc({@required this.repository}) {
    addFieldBlocs(fieldBlocs: [
      bankName,
      countryList,
      cityList,
      departamentList,
      userName,
      phone,
      email,
      documenNumber,
      isAdmin,
    ]);
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
  final userName = TextFieldBloc();
  final phone = TextFieldBloc();
  final email = TextFieldBloc(validators: [UtilsTools.required]);
  final documenNumber = TextFieldBloc();
  final isAdmin = BooleanFieldBloc(initialValue: false);

  addUser() {
    final adminCreateBankUser = AdminCreateBankUser(
        firstname: userName.value,
        lastname: '',
        email: email.value,
        phone: phone.value,
        documenNumber: documenNumber.value,
        country: 1,
        isActive: true,
        role: 'admin',
        countryIso: 'CO');

    // ferify if phone or email are abiable before add

    userList.add(adminCreateBankUser);
    print(adminCreateBankUser.toJson());
  }

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }

  Future<void> close() {
    return super.close();
  }
}
