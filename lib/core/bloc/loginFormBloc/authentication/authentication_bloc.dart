import 'dart:async';

import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
  extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository;

  AuthenticationBloc({
    @required this.loginRepository
  }) : assert(loginRepository != null),
       super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      yield AuthenticationUnauthenticated();
    }
  }
}
