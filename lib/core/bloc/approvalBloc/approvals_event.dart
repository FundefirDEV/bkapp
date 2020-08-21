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

class ApprovalsPost extends ApprovalsEvent {
  final int idRequest;
  final String token;
  final String requestType;
  final String approvalStatus;

  ApprovalsPost({this.token, this.requestType, this.idRequest, this.approvalStatus});

  @override
  List<Object> get props => [token, requestType, idRequest, approvalStatus];

  @override
  String toString() => 'ApprovalsPost { token: $token, requestType: $requestType, idRequest: $idRequest, approvalStatus: $approvalStatus }';
}
