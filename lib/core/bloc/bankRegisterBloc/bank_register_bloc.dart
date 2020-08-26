import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profile_register_repository.dart';
import 'package:bkapp_flutter/core/services/sql/partner_sql.dart';
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

  BankRegisterBloc({@required this.repository})
      : _selectPlace = SelectCityBloc(),
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

  Future makeSubmit() async {
    try {
      logger.v({
        'bank name': '${name.value}',
        'state': '${_selectPlace.selectState.value}',
        'city': '${items.indexOf(_selectPlace.selectCity.value)}',
        'token': '${token.value}',
      });

      PartnerDatabaseProvider partnerDb = PartnerDatabaseProvider.db;
      var getPartners = await partnerDb.getAllParters();
      List<Object> partners = List<Object>();
      getPartners.forEach((partner) {
        partners.add({
          "name": "${partner.firstname}",
          "phone": partner.phone.replaceAll(new RegExp(r'\W'), ''),
        });
      });
      var selectedCity = items.indexOf(_selectPlace.selectCity.value);
      await repository.registerBank(
          selectedCity, name.value, partners, token.value);
    } catch (e) {
      print(e);
      return 'error';
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
