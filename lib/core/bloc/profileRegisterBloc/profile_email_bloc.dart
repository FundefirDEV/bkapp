import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileEmailBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(validators: [
    UtilsTools.required,
    FieldBlocValidators.email,
  ]);

  ProfileEmailBloc() {
    addFieldBlocs(fieldBlocs: [email]);
  }

  bool validEmail(){

    final res = FieldBlocValidators.email(email.value) == null && email.value.length > 5;
    return !res;
  }

  @override
  void onSubmitting() async {}

  @override
  Future<void> close() {
    //email?.clear();
    // email.state.toString();
    // print('manso');
    //return super.close();
  }
}
