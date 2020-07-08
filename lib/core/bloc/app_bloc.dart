import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'profileRegisterBloc/profile_register_bloc.dart';

class AppBloc extends FormBloc<String, String> {
  ProfileRegisterBloc _profileRegisterBloc;
  ProfileEditFormBloc _profileEditFormBloc;
  BuySharesFormBloc _buySharesFormBloc;
  CreditFormBloc _creditFormBloc;

  AppBloc()
      : _profileRegisterBloc = ProfileRegisterBloc(),
        _profileEditFormBloc = ProfileEditFormBloc(),
        _buySharesFormBloc = BuySharesFormBloc(),
        _creditFormBloc = CreditFormBloc();

  ProfileRegisterBloc get profileRegisterBloc => _profileRegisterBloc;
  ProfileEditFormBloc get profileEditFormBloc => _profileEditFormBloc;
  BuySharesFormBloc get buySharesFormBloc => _buySharesFormBloc;
  CreditFormBloc get creditFormBloc => _creditFormBloc;

  @override
  void onSubmitting() {}
}
