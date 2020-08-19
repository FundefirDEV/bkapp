part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final Map<String, dynamic> tokenInformation;

  LoggedIn({@required this.tokenInformation});

  @override
  List<Object> get props => [tokenInformation];

  @override
  String toString() => 'LoggedIn { token-information: $tokenInformation }';
}

class LoggedOut extends AuthenticationEvent {}
