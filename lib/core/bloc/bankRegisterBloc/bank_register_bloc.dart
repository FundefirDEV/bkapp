import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profile_register_repository.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:logger/logger.dart';

class BankRegisterBloc extends FormBloc<String, String> {
  static List<String> items = [
    'Select your city',
    'Bogotá DC',
    'Madrid',
    'Soacha'
  ];
  final ProfileRegisterRepository repository;

  SelectCityBloc _selectPlace;
  InviteFormBloc _inviteForm;

  final name = TextFieldBloc();
  final token = TextFieldBloc();

  List<PartnerModel> partnerList = [];

  BankRegisterBloc({@required this.repository})
      : _selectPlace = SelectCityBloc(repository: locationRepository),
        _inviteForm = InviteFormBloc(partnerRepository: partnerRepository) {
    addFieldBlocs(fieldBlocs: [name]);
  }

  SelectCityBloc get selectPlace => _selectPlace;
  InviteFormBloc get inviteForm => _inviteForm;

  var logger = Logger(
      printer: PrettyPrinter(
    colors: false,
    errorMethodCount: 1,
    printEmojis: true,
    printTime: true,
    lineLength: 80,
    methodCount: 0,
  ));

  void clearData(){
    partnerList = [];
    name.updateValue('');
    name.updateInitialValue('');
  }

  Future<String> makeSubmit() async {
    try {
      logger.v({
        'bank name': '${name.value}',
        'state': '${_selectPlace.selectState.value}',
        'city': '${items.indexOf(_selectPlace.selectCity.value)}',
        'token': '${token.value}',
      });

      List<Object> partners = [];

      partnerList.forEach((partner) {
        partners.add({
          "name": "${partner.firstname}",
          "phone": partner.phone.replaceAll(new RegExp(r'\W'), ''),
        });
      });
      var selectedCity = items.indexOf(_selectPlace.selectCity.value);
      await repository.registerBank(
          selectedCity, name.value, partners, token.value);
      partnerList = [];

      clearData();
      
      return 'bank created!';

    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  @override
  void onSubmitting() {}

  Future<void> close() {
    name?.close();
    token?.close();
    return super.close();
  }
}
