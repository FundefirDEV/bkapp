part of 'admin_create_bank_bloc.dart';

abstract class AdminCreateBankEvent extends Equatable {
  const AdminCreateBankEvent();

  @override
  List<Object> get props => [];
}

class AdminCreateBankInitialize extends AdminCreateBankEvent {
  AdminCreateBankInitialize({
    this.token,
    @required this.role,
  });
  final String token;
  final String role;

  @override
  List<Object> get props => [token, role];

  @override
  String toString() => 'ProfiPaymentInitialize { token: $token role: $role }';
}

class AdminCreateBankPartnerNotAdminEvent extends AdminCreateBankEvent {
  AdminCreateBankPartnerNotAdminEvent(
      {@required this.idPartner, @required this.token});
  final String idPartner;
  final String token;

  @override
  List<Object> get props => [idPartner];

  @override
  String toString() =>
      'AdminCreateBankPartnerSelected { idPartner: $idPartner }';
}

class CreateBank extends AdminCreateBankEvent {
  CreateBank({@required this.idPartner, @required this.token});
  final String idPartner;
  final String token;

  @override
  String toString() => 'CreateBank { idPartner: $idPartner token: $token }';

  @override
  List<Object> get props => [idPartner, token];
}
