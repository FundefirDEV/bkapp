part of 'buy_shares_bloc.dart';

abstract class BuySharesEvent extends Equatable {
  const BuySharesEvent();

  @override
  List<Object> get props => [];
}

class BuySharesInitialize extends BuySharesEvent {
  final String token;
  BuySharesInitialize({this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'BuySharesInitialize { token: $token }';
}
