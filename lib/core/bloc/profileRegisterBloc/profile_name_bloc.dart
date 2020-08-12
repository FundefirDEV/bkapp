import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileNameBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(validators: [UtilsTools.required]);
  final secondName = TextFieldBloc(validators: [UtilsTools.required]);

  ProfileNameBloc() {
    addFieldBlocs(fieldBlocs: [firstName, secondName]);
  }

  @override
  void onSubmitting() async {}

  Future<void> close() {
    firstName.close();
    secondName.close();
    return super.close();
  }
}
