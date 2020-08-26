part of 'partner_bloc.dart';

abstract class PartnerState extends Equatable {
  const PartnerState();

  @override
  List<Object> get props => [];
}

class PartnerInitial extends PartnerState {}

class PartnerVerified extends PartnerState {
  PartnerVerified({ @required this.phoneNumber });
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() => 'PartnerVerified { phoneNumber: $phoneNumber }';
}

class PartnerLoading extends PartnerState {}

class PartnerUnauthorized extends PartnerState {
  PartnerUnauthorized({ @required this.phoneNumber, @required this.error });
  final String phoneNumber;
  final String error;

  @override
  List<Object> get props => [phoneNumber, error];

  @override
  String toString() => 'PartnerUnauthorized { phoneNumber: $phoneNumber }';
}

class PartnerAddedToDb extends PartnerState {}

class PartnerAddedToBack extends PartnerState {}

class PartnerFailureToBack extends PartnerState {
  PartnerFailureToBack({ @required this.phoneNumber, @required this.error });
  final String phoneNumber;
  final String error;

  @override
  List<Object> get props => [phoneNumber, error];

  @override
  String toString() => 'PartnerFailureToBack { phoneNumber: $phoneNumber }';
}
