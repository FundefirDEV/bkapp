part of 'administrator_asignment_bloc.dart';

abstract class AdministratorAsignmentEvent extends Equatable {
  const AdministratorAsignmentEvent();

  @override
  List<Object> get props => [];
}

class AdministratorAsignmentInitialize extends AdministratorAsignmentEvent {
  final String token;
  AdministratorAsignmentInitialize({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'AdministratorAsignmentInitialize { token: $token }';
}

class AdministratorAsignmentPost extends AdministratorAsignmentEvent {
  final String token;
  final String name;
  final String phone;
  final String partnerType;

  AdministratorAsignmentPost(
      {this.token, this.name, this.phone, this.partnerType});

  @override
  List<Object> get props => [token, name, phone, partnerType];

  @override
  String toString() =>
      'ApprovalsPost { token: $token, name: $name, phone: $phone, partnerType: $partnerType }';
}
