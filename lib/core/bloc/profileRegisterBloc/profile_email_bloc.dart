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

  @override
  void onSubmitting() async {}

  Future<void> close() {
    email?.close();
    return super.close();
  }
}
