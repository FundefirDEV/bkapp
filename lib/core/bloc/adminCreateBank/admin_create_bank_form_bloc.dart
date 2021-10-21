import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_model.dart';
import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/admin_create_bank_repository.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:rxdart/rxdart.dart';

class AdminCreateBankFormBloc extends FormBloc<dynamic, dynamic> {
  AdminCreateBankFormBloc({@required this.repository}) {
    addFieldBlocs(fieldBlocs: [
      bankName,
      countryList,
      cityList,
      departamentList,
      firtsName,
      lastName,
      phone,
      email,
      documenNumber,
      isAdmin,
    ]);
  }

  final AdminCreateBankRepository repository;

  final _userListController = BehaviorSubject<List<AdminCreateBankUser>>();
  Stream<List<AdminCreateBankUser>> get userListStream =>
      _userListController.stream.asBroadcastStream();

  Function(List<AdminCreateBankUser>) get updateUserList =>
      _userListController.sink.add;

  final List<AdminCreateBankUser> userList = [
    // AdminCreateBankUser(email: 'manaos'),
    // AdminCreateBankUser(email: 'manaos 2')
  ];

  final countryList = SelectFieldBloc<DropDownModel, String>(
      items: [DropDownModel(id: 'CO', text: 'colombia')]);
  final departamentList = SelectFieldBloc<DropDownModel, String>(
      items: [DropDownModel(id: '1', text: 'cundinadarca')]);
  final cityList = SelectFieldBloc<DropDownModel, String>(
      items: [DropDownModel(id: '1', text: 'bogotá')]);
  final bankName = TextFieldBloc(validators: [UtilsTools.required]);
  final firtsName = TextFieldBloc(validators: [UtilsTools.required]);
  final lastName = TextFieldBloc(validators: [UtilsTools.required]);

  final phone = TextFieldBloc(
      validators: [UtilsTools.required, UtilsTools.minPhoneNumber]);
  final email = TextFieldBloc(
      validators: [UtilsTools.required, FieldBlocValidators.email]);
  final documenNumber = TextFieldBloc(validators: [UtilsTools.required]);
  final isAdmin = BooleanFieldBloc(initialValue: false);

  bool verifyEmail(String email) {
    return !userList.any((user) => user.email == email);
  }

  bool verifyPhone(String phone) {
    return !userList.any((user) => user.phone == phone);
  }

  void clearPartnerForm() {
    firtsName.clear();
    lastName.clear();
    phone.clear();
    email.clear();
    documenNumber.clear();
    isAdmin.clear();
  }

  addUser(BuildContext context) async {
    // ferify if phone or email are abiable before add

    if (!verifyEmail(email.value)) {
      addEmailError(context);
      return;
    }
    if (!verifyPhone(phone.value)) {
      addPhoneError(context);
      return;
    }

    final emailRes = await repository.verifyEmail(email.value);
    final phoneRes = await repository.verifyPhone(phone.value);

    if (!emailRes) {
      addEmailError(context);
      return;
    }
    if (!phoneRes) {
      addPhoneError(context);
      return;
    }
    final adminCreateBankUser = AdminCreateBankUser(
        firstname: firtsName.value,
        lastname: lastName.value,
        email: email.value,
        phone: phone.value,
        documenNumber: documenNumber.value,
        country: 1,
        isActive: true,
        role: isAdmin.value ? 'admin' : 'partner',
        countryIso: 'CO');

    userList.add(adminCreateBankUser);
    updateUserList(userList);
    print(adminCreateBankUser.toJson());
    clearPartnerForm();
    Navigator.pop(context);
  }

  void addPhoneError(BuildContext context) {
    phone.addFieldError(I18n.of(context).requestErrorPhoneNotAviable,
        isPermanent: true);
  }

  void addEmailError(BuildContext context) {
    email.addFieldError(I18n.of(context).requestErrorMailNotAviable,
        isPermanent: true);
  }

  void deletePartner(int index) {
    userList.removeAt(index);
    updateUserList(userList);
  }

  void createBank(BuildContext context) {
    final adminBank = AdminCreateBankModel(
      bankName: 'manaos',
      city: 1,
      users: userList,
    );

    print(adminBank.toJson());
  }

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: false);
  }

  Future<void> close() {
    _userListController.close();
    return super.close();
  }
}
