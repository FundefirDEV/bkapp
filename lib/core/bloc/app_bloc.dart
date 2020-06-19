import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'profileRegisterBloc/profile_register_bloc.dart';

class AppBloc extends FormBloc<String, String> {
  ProfileRegisterBloc _profileRegisterBloc;
  ProfileEditFormBloc _profileEditFormBloc;

  AppBloc()
      : _profileRegisterBloc = ProfileRegisterBloc(),
        _profileEditFormBloc = ProfileEditFormBloc();

  ProfileRegisterBloc get profileRegisterBloc => _profileRegisterBloc;
  ProfileEditFormBloc get profileEditFormBloc => _profileEditFormBloc;

  @override
  void onSubmitting() {}
}
