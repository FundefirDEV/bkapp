import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileGenderBloc extends FormBloc<String, String> {
  final gender = TextFieldBloc();

  ProfileGenderBloc() {
    addFieldBlocs(fieldBlocs: [gender]);
  }

  @override
  void onSubmitting() async {}

  Future<void> close() {
    gender?.close();
    return super.close();
  }
}
