part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  AuthenticationAuthenticated({@required this.token, @required this.userName});
  final String token;
  final String userName;

  @override
  List<Object> get props => [token, userName];

  @override
  String toString() => 'AuthenticationAuthenticated { token: $token }';
}

class AuthenticationUnauthenticated extends AuthenticationState {}
