part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final BankInfoModel bkInformation;

  HomeLoaded({@required this.bkInformation});

  @override
  List<Object> get props => [bkInformation];
}

class HomeFailure extends HomeState {}
