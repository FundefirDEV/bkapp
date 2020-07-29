part of 'approvals_bloc.dart';

abstract class ApprovalsState extends Equatable {
  const ApprovalsState();

  @override
  List<Object> get props => [];
}

class ApprovalsInitial extends ApprovalsState {}

class ApprovalsLoading extends ApprovalsState {}

class ApprovalsLoaded extends ApprovalsState {
  final Map approvals;

  ApprovalsLoaded({@required this.approvals});

  @override
  List<Object> get props => [approvals];
}

class ApprovalsFailure extends ApprovalsState {}
