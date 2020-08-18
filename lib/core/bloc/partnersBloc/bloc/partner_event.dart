part of 'partner_bloc.dart';

abstract class PartnerEvent extends Equatable {
  const PartnerEvent();

  @override
  List<Object> get props => [];
}

class AddAndVerifyPartner extends PartnerEvent {
  AddAndVerifyPartner({
    @required this.token, this.name, @required this.phoneNumber
  });
  final String token;
  final String name;
  final String phoneNumber;

  @override
  List<Object> get props => [token, name, phoneNumber];
}

class JustValidatePartner extends PartnerEvent {
  JustValidatePartner({
    @required this.token, this.name, @required this.phoneNumber
  });
  final String token;
  final String name;
  final String phoneNumber;

  @override
  List<Object> get props => [token, name, phoneNumber];
}

class AddPartnerToDb extends PartnerEvent {
  AddPartnerToDb({@required this.name, @required this.phoneNumber });
  final String name;
  final String phoneNumber;

  @override
  List<Object> get props => [name, phoneNumber];
}
