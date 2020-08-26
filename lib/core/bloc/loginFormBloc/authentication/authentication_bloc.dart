import 'dart:async';

import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/login_repository.dart';
import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc({@required this.loginRepository})
      : assert(loginRepository != null),
        super(AuthenticationUninitialized());

  final LoginRepository loginRepository;
  PartnerDatabaseProvider partnerDb = PartnerDatabaseProvider.db;
  ActivePartnersDbProvider activePartnersDb = ActivePartnersDbProvider.db;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      yield AuthenticationAuthenticated(
          token: event.tokenInformation['access_token'],
          userName: UtilsTools.titleCase(
              '${event.tokenInformation['firstname']} ${event.tokenInformation['lastname']}'),
          role: event.tokenInformation['role']);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await partnerDb.deleteAllPartners();
      await activePartnersDb.deleteAllPartners();
      yield AuthenticationUnauthenticated();
    }
  }
}
