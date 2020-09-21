part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  AuthenticationAuthenticated(
      {this.role, @required this.token, @required this.userName});
  final String token;
  final String userName;
  final String role;

  @override
  List<Object> get props => [token, userName, role];

  @override
  String toString() => 'AuthenticationAuthenticated { token: $token }';
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationUnauthenticatedFailed extends AuthenticationState {}
