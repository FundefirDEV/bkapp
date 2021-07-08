part of 'partner_bloc.dart';

abstract class PartnerState extends Equatable {
  const PartnerState();

  @override
  List<Object> get props => [];
}


class PartnerLoaded extends PartnerState {
  final List<PartnerModel> partnerList;

  PartnerLoaded({this.partnerList});

  @override
  List<Object> get props => [partnerList];
}

class PartnerInitial extends PartnerState {}

class PartnerLoading extends PartnerState {}

class PartnerFailure extends PartnerState {
  PartnerFailure({ @required this.error });
  final String error;

  @override
  List<Object> get props => [ error];

}
