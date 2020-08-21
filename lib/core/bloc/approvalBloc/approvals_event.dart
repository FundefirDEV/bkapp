part of 'approvals_bloc.dart';

abstract class ApprovalsEvent extends Equatable {
  const ApprovalsEvent();

  @override
  List<Object> get props => [];
}

class ApprovalsInitialize extends ApprovalsEvent {
  final String token;
  ApprovalsInitialize({ @required this.token });

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'ApprovalsInitialize { token: $token }';
}
