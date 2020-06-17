import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'profileRegisterBloc/profile_register_bloc.dart';

class AppBloc extends FormBloc<String, String> {
  ProfileRegisterBloc _profileRegisterBloc;

  AppBloc()
    : _profileRegisterBloc = ProfileRegisterBloc();

  ProfileRegisterBloc get profileRegisterBloc => _profileRegisterBloc;

  @override
  void onSubmitting() {}
}
