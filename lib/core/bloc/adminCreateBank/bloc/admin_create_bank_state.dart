part of 'admin_create_bank_bloc.dart';

abstract class AdminCreateBankState extends Equatable {
  const AdminCreateBankState();

  @override
  List<Object> get props => [];
}

class AdminCreateBankInitial extends AdminCreateBankState {}

class AdminCreateBankLoading extends AdminCreateBankState {}

class AdminCreateBankFailure extends AdminCreateBankState {
  AdminCreateBankFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
