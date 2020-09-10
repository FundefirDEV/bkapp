part of 'profit_payment_bloc.dart';

abstract class ProfitPaymentEvent extends Equatable {
  const ProfitPaymentEvent();

  @override
  List<Object> get props => [];
}

class ProfitPaymentInitialize extends ProfitPaymentEvent {
  ProfitPaymentInitialize({this.token});
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'ProfiPaymentInitialize { token: $token }';
}

class ProfitPaymentPartnerSelected extends ProfitPaymentEvent {
  ProfitPaymentPartnerSelected({this.idPartner});
  final String idPartner;

  @override
  List<Object> get props => [idPartner];

  @override
  String toString() => 'ProfitPaymentPartnerSelected { idPartner: $idPartner }';
}

class TurnIntoShares extends ProfitPaymentEvent {
  TurnIntoShares({this.yearsTurnIntoShares});
  final List<String> yearsTurnIntoShares;

  @override
  List<Object> get props => [yearsTurnIntoShares];
}
