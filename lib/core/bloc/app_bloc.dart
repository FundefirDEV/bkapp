import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/home/home_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

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
  PartnerBloc _partnerBloc;
  BankRulesBloc _bankRulesBloc;

  AppBloc()
      : _authenticationBloc =
            AuthenticationBloc(loginRepository: loginRepository)
              ..add(AppStarted()),
        _profileRegisterBloc =
            ProfileRegisterBloc(repository: profileRegisterRepository),
        _bankRegisterBloc =
            BankRegisterBloc(repository: profileRegisterRepository),
        _profileEditFormBloc = ProfileEditFormBloc(),
        _buySharesFormBloc = BuySharesFormBloc(repository: shareRepository),
        _creditFormBloc = CreditFormBloc(creditRepository: creditRepository),
        _rulesEditFormBloc = RulesEditFormBloc(),
        _approvalsBloc = ApprovalsBloc(repository: approvalsRepository),
        _homeBloc = HomeBloc(repository: homeRepository),
        _partnerBloc = PartnerBloc(partnerRepository: partnerRepository),
        _bankRulesBloc = BankRulesBloc(repository: bankRulesRepository);

  AuthenticationBloc get authenticationBloc => _authenticationBloc;
  ProfileRegisterBloc get profileRegisterBloc => _profileRegisterBloc;
  BankRegisterBloc get bankRegisterBloc => _bankRegisterBloc;
  ProfileEditFormBloc get profileEditFormBloc => _profileEditFormBloc;
  BuySharesFormBloc get buySharesFormBloc => _buySharesFormBloc;
  CreditFormBloc get creditFormBloc => _creditFormBloc;
  RulesEditFormBloc get rulesEditFormBloc => _rulesEditFormBloc;
  ApprovalsBloc get approvalsBloc => _approvalsBloc;
  HomeBloc get homeBloc => _homeBloc;
  PartnerBloc get partnerBloc => _partnerBloc;
  BankRulesBloc get bankRulesBloc => _bankRulesBloc;

  @override
  void onSubmitting() {}
}
