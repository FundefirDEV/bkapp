part of 'profit_payment_bloc.dart';

abstract class ProfitPaymentState extends Equatable {
  const ProfitPaymentState();

  @override
  List<Object> get props => [];
}

class ProfitPaymentInitial extends ProfitPaymentState {}

class ProfitPaymentLoading extends ProfitPaymentState {}

class ProfitPaymentLoaded extends ProfitPaymentState {
  ProfitPaymentLoaded({this.historyEarnings, this.partners});
  final String historyEarnings;
  final List<DropDownModel> partners;
  @override
  List<Object> get props => [historyEarnings, partners];
}

class ProfitPaymentDetail extends ProfitPaymentState {
  ProfitPaymentDetail({this.profitPartner});
  final ProfitPartnerModel profitPartner;
  @override
  List<Object> get props => [profitPartner];
}

class ProfitPaymentFailure extends ProfitPaymentState {
  ProfitPaymentFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
