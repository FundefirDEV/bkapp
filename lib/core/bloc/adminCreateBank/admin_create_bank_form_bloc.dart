import 'package:bkapp_flutter/core/bloc/adminCreateBank/bloc/admin_create_bank_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_model.dart';
import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';
import 'package:bkapp_flutter/core/models/dropdown_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/admin_create_bank_repository.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
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

    updateLoading(false);

    countryList.onValueChanges(onData: (previous, current) async* {
      departamentList.clear();
      cityList.clear();
      countryCode = current.value.id;
      updateDepartament(locationModel);
      updateCitys(current);
    });

    departamentList.onValueChanges(onData: (previous, current) async* {
      cityList.clear();
      updateCitys(current);
    });
  }

  void initCountry(BuildContext context) {
    AdminCreateBankBloc adminCreateBankBloc =
        context.read<AdminCreateBankBloc>();

    if (locationModel.isEmpty) {
      locationModel = adminCreateBankBloc.locationModel;

      updateCountry(locationModel);
      updateDepartament(locationModel);
    }
  }

  void updateCountry(List<dynamic> locationModel) {
    List<DropDownModel> _countryList = [];

    locationModel.forEach((c) {
      _countryList.add(DropDownModel(id: c.code, text: c.name));
    });

    countryList.updateItems(_countryList);
    //countryList.updateInitialValue(_countryList.first);
  }

  void updateDepartament(List<dynamic> locationModel) {
    print(countryCode);
    final country = locationModel.where((l) => l.code == countryCode).first;
    print(country);
    //listCountry.item.add(country);
    List<DropDownModel> _departamentList = [];

    country.departaments.forEach((dep) {
      _departamentList
          .add(DropDownModel(id: dep.id.toString(), text: dep.name));
    });
    departamentList.updateItems(_departamentList);
    //departamentList.updateInitialValue(_departamentList.first);
  }

  void updateCitys(SelectFieldBlocState<DropDownModel, String> current) {
    if (countryList.value != null) {
      List<DropDownModel> city = [];
      final country = locationModel.where((l) => l.code == countryCode).first;
      final departments = country.departaments
          .where((c) => c.id.toString() == current.value.id)
          .first;
      departments.cities.forEach((value) {
        city.add(DropDownModel(text: value.name, id: value.id.toString()));
      });
      if (city.length > 0) {
        cityList.updateItems(city);
        //cityList.updateInitialValue(city.first);
      }
    }
  }

  final AdminCreateBankRepository repository;

  final _userListController = BehaviorSubject<List<AdminCreateBankUser>>();
  Stream<List<AdminCreateBankUser>> get userListStream =>
      _userListController.stream.asBroadcastStream();

  Function(List<AdminCreateBankUser>) get updateUserList =>
      _userListController.sink.add;

  final _loadingController = BehaviorSubject<bool>();
  Stream<bool> get loadingStream =>
      _loadingController.stream.asBroadcastStream();

  Function(bool) get updateLoading => _loadingController.sink.add;

  final List<AdminCreateBankUser> userList = [
    // AdminCreateBankUser(email: 'manaos'),
    // AdminCreateBankUser(email: 'manaos 2')
  ];

  final countryList =
      SelectFieldBloc<DropDownModel, String>(validators: [UtilsTools.required]);
  final departamentList =
      SelectFieldBloc<DropDownModel, String>(validators: [UtilsTools.required]);
  final cityList =
      SelectFieldBloc<DropDownModel, String>(validators: [UtilsTools.required]);
  final bankName = TextFieldBloc(validators: [UtilsTools.required]);
  final firtsName = TextFieldBloc(validators: [UtilsTools.required]);
  final lastName = TextFieldBloc(validators: [UtilsTools.required]);

  final phone = TextFieldBloc(
      validators: [UtilsTools.required, UtilsTools.minPhoneNumber]);
  final email = TextFieldBloc(
      validators: [UtilsTools.required, FieldBlocValidators.email]);
  final documenNumber = TextFieldBloc(validators: [UtilsTools.required]);
  final isAdmin = BooleanFieldBloc(initialValue: false);
  final token = TextFieldBloc();

  String countryCode = 'CO';
  List<dynamic> locationModel = [];

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

    updateLoading(true);

    if (!verifyEmail(email.value)) {
      updateLoading(false);
      addEmailError(context);
      return;
    }
    if (!verifyPhone(phone.value)) {
      updateLoading(false);
      addPhoneError(context);
      return;
    }

    final emailRes = await repository.verifyEmail(email.value);
    final phoneRes = await repository.verifyPhone(phone.value);

    if (!emailRes) {
      updateLoading(false);
      addEmailError(context);
      return;
    }
    if (!phoneRes) {
      updateLoading(false);
      addPhoneError(context);
      return;
    }
    final adminCreateBankUser = AdminCreateBankUser(
      firstname: firtsName.value,
      lastname: lastName.value,
      email: email.value,
      phone: phone.value,
      documenNumber: documenNumber.value,
      country: int.tryParse(countryList.value.id),
      isActive: false,
      role: isAdmin.value ? 'admin' : 'partner',
      // Add countryIso when post create bank
      //countryIso: countryList.value.id.toString()
    );

    userList.add(adminCreateBankUser);
    updateUserList(userList);
    print(adminCreateBankUser.toJson());
    clearPartnerForm();
    updateLoading(false);
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

  Future createBank(BuildContext context) async {
    updateLoading(true);
    userList.forEach((user) {
      user.countryIso = countryCode;
    });
    print(_loadingController.stream.value);

    if (userList.length == 0) {
      updateLoading(false);
      print('no partners');
      return;
    }

    // one admin minimum
    final thereAdmin = userList.any((user) => user.role == 'admin');
    if (thereAdmin) userList.first.role = 'admin';

    final adminBank = AdminCreateBankModel(
      bankName: bankName.value,
      city: int.tryParse(cityList.value.id),
      users: userList,
    );

    print(adminBank.toJson());

    try {
      await repository.adminCreateBank(token.value, adminBank);

      clear();
      //Navigator.pop(context);
      context
          .read<MenuNavigatorBloc>()
          .add(ButtonPressed(goTo: HomeRoutesConstant.homeScreen));
      //print('Bank created !, res : ${res.toString()}');
    } catch (e) {
      print('Error: ${e.toString()}');
      _showDialog(context, e.toString());
    }
    updateLoading(false);
  }

  void _showDialog(BuildContext context, String error) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return ImageBottomModal(
            modalHeight: 45.0,
            image: 'assets/images/sad_bot.svg',
            title: I18n.of(context).requestErrorCreatedBankInvalid,
            isBold: true,
            isBtnAccept: false,
            isImageBg: false,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressCancel: () => Navigator.pop(context),
            technicalData: error,
          );
        });
  }

  //final listCountry = AddFieldBlocItem([]);

  bool validateBoxSelect() {
    return bankName.state.isValid &&
        countryList.state.isValid &&
        departamentList.state.isValid &&
        cityList.state.isValid;
  }

  void boxSelectAddError(BuildContext context) {
    if (!bankName.state.isValid)
      bankName.addFieldError(I18n.of(context).errorRequired);
    if (!countryList.state.isValid)
      countryList.addFieldError(I18n.of(context).errorRequired);
    if (!departamentList.state.isValid)
      departamentList.addFieldError(I18n.of(context).errorRequired);
    if (!cityList.state.isValid)
      cityList.addFieldError(I18n.of(context).errorRequired);
  }

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: false);
  }

  Future<void> close() {
    _userListController.close();
    _loadingController.close();
    return super.close();
  }
}
