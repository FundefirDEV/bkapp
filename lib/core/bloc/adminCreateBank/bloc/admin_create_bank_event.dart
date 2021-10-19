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

class CreateBank extends AdminCreateBankEvent {
  CreateBank({@required this.token});
  final String token;

  @override
  String toString() => 'CreateBank { token: $token }';

  @override
  List<Object> get props => [token];
}
