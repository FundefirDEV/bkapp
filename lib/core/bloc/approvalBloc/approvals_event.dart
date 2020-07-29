part of 'approvals_bloc.dart';

abstract class ApprovalsEvent extends Equatable {
  const ApprovalsEvent();

  @override
  List<Object> get props => [];
}

class ApprovalsInitialize extends ApprovalsEvent {}
