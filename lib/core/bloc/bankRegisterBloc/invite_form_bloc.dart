import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InviteFormBloc extends FormBloc<String, String> {

  final name = TextFieldBloc(
    validators: [UtilsTools.required]
  );
  final cellPhone = TextFieldBloc(
    validators: [
      UtilsTools.required,
      UtilsTools.minPhoneNumber,
    ]
  );

  InviteFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        cellPhone
      ]
    );
  }

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
    clear();
  }

  Future<void> close() {
    name.close();
    cellPhone.close();
    return super.close();
  }
}
