part of 'buy_shares_bloc.dart';

abstract class BuySharesState extends Equatable {
  const BuySharesState();

  @override
  List<Object> get props => [];
}

class BuySharesInitial extends BuySharesState {}

class BuySharesLoading extends BuySharesState {}

class BuySharesLoaded extends BuySharesState {
  final SharesInfoModel infoShares;

  BuySharesLoaded({@required this.infoShares});

  @override
  List<Object> get props => [infoShares];
}

class BuySharesFailure extends BuySharesState {
  final String error;

  BuySharesFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
