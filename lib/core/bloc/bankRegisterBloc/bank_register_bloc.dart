import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:logger/logger.dart';

class BankRegisterBloc extends FormBloc<String, String> {
  SelectCityBloc _selectPlace;
  InviteFormBloc _inviteForm;
  final name = TextFieldBloc();

  BankRegisterBloc()
      : _selectPlace = SelectCityBloc(),
        _inviteForm = InviteFormBloc() {
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

  @override
  void onSubmitting() {
    logger.v({
      'bank name': '${name.value}',
      'state': '${_selectPlace.selectState.value}',
      'city': '${_selectPlace.selectCity.value}',
      'phone': '${_inviteForm.name.value}',
    });
    emitSuccess();
  }

  Future<void> close() {
    name?.close();
    return super.close();
  }
}
