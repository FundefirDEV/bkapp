part of 'profit_payment_bloc.dart';

abstract class ProfitPaymentState extends Equatable {
  const ProfitPaymentState();

  @override
  List<Object> get props => [];
}

class ProfitPaymentInitial extends ProfitPaymentState {}

class ProfitPaymentLoading extends ProfitPaymentState {}

class ProfitPaymentLoaded extends ProfitPaymentState {
  ProfitPaymentLoaded({this.historyEarnings, this.partners , @required this.shareValue});
  final String historyEarnings;
  final List<DropDownModel> partners;
  final double shareValue;
  @override
  List<Object> get props => [historyEarnings, partners];
}

class ProfitPaymentPartnerNotAdmin extends ProfitPaymentState {
  ProfitPaymentPartnerNotAdmin({
    @required this.parnerId , 
    @required this.profitPartner,
    @required this.historyEarnings,
  });

  final int parnerId;
  ProfitPartnerModel profitPartner;
  final String historyEarnings;

  @override
  List<Object> get props => [parnerId];
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
