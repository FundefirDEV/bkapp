part of 'mybank_bloc.dart';

abstract class MyBankState extends Equatable {
  const MyBankState();
  
  @override
  List<Object> get props => [];
}

class MyBankInitial extends MyBankState {}

class MyBankLoading extends MyBankState {}

class MyBankLoaded extends MyBankState {
  MyBankLoaded({@required this.data});
  final MyBankModel data;

  @override
  List<Object> get props => [data];
}

class MyBankFailure extends MyBankState {}
