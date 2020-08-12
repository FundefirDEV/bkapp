import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/home/home_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'profileRegisterBloc/profile_register_bloc.dart';

class AppBloc extends FormBloc<String, String> {
  AuthenticationBloc _authenticationBloc;
  ProfileRegisterBloc _profileRegisterBloc;
  BankRegisterBloc _bankRegisterBloc;
  ProfileEditFormBloc _profileEditFormBloc;
  BuySharesFormBloc _buySharesFormBloc;
  CreditFormBloc _creditFormBloc;
  RulesEditFormBloc _rulesEditFormBloc;
  ApprovalsBloc _approvalsBloc;
  HomeBloc _homeBloc;

  AppBloc()
      : _authenticationBloc =
            AuthenticationBloc(loginRepository: loginRepository)
              ..add(AppStarted()),
        _profileRegisterBloc = ProfileRegisterBloc(),
        _bankRegisterBloc = BankRegisterBloc(),
        _profileEditFormBloc = ProfileEditFormBloc(),
        _buySharesFormBloc = BuySharesFormBloc(),
        _creditFormBloc = CreditFormBloc(),
        _rulesEditFormBloc = RulesEditFormBloc(),
        _approvalsBloc = ApprovalsBloc(repository: approvalsRepository),
        _homeBloc = HomeBloc(repository: homeRepository);

  AuthenticationBloc get authenticationBloc => _authenticationBloc;
  ProfileRegisterBloc get profileRegisterBloc => _profileRegisterBloc;
  BankRegisterBloc get bankRegisterBloc => _bankRegisterBloc;
  ProfileEditFormBloc get profileEditFormBloc => _profileEditFormBloc;
  BuySharesFormBloc get buySharesFormBloc => _buySharesFormBloc;
  CreditFormBloc get creditFormBloc => _creditFormBloc;
  RulesEditFormBloc get rulesEditFormBloc => _rulesEditFormBloc;
  ApprovalsBloc get approvalsBloc => _approvalsBloc;
  HomeBloc get homeBloc => _homeBloc;

  @override
  void onSubmitting() {}
}
