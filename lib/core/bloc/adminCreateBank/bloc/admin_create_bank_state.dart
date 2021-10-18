part of 'admin_create_bank_bloc.dart';

abstract class AdminCreateBankState extends Equatable {
  const AdminCreateBankState();

  @override
  List<Object> get props => [];
}

class AdminCreateBankInitial extends AdminCreateBankState {}

class AdminCreateBankLoading extends AdminCreateBankState {}

class AdminCreateBankLoaded extends AdminCreateBankState {
  AdminCreateBankLoaded(
      {this.historyEarnings, this.partners, @required this.shareValue});
  final String historyEarnings;
  final List<DropDownModel> partners;
  final double shareValue;
  @override
  List<Object> get props => [historyEarnings, partners];
}

class AdminCreateBankPartnerNotAdmin extends AdminCreateBankState {
  AdminCreateBankPartnerNotAdmin({
    @required this.parnerId,
    @required this.profitPartner,
    @required this.historyEarnings,
  });

  final int parnerId;
  ProfitPartnerModel profitPartner;
  final String historyEarnings;

  @override
  List<Object> get props => [parnerId];
}

class AdminCreateBankDetail extends AdminCreateBankState {
  AdminCreateBankDetail({this.profitPartner});
  final ProfitPartnerModel profitPartner;
  @override
  List<Object> get props => [profitPartner];
}

class AdminCreateBankFailure extends AdminCreateBankState {
  AdminCreateBankFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
