part of 'mybank_bloc.dart';

abstract class MyBankState extends Equatable {
  const MyBankState();

  @override
  List<Object> get props => [];
}

class MyBankInitial extends MyBankState {}

class MyBankLoading extends MyBankState {}

class MyBankLoaded extends MyBankState {
  MyBankLoaded({
    @required this.data,
    @required this.bankInfoModel,
  });
  final MyBankModel data;
  final BankInfoModel bankInfoModel;

  @override
  List<Object> get props => [data, bankInfoModel];
}

class MyBankFailure extends MyBankState {
  MyBankFailure({@required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
