part of 'bank_rules_bloc.dart';

abstract class BankRulesEvent extends Equatable {
  const BankRulesEvent();

  @override
  List<Object> get props => [];
}

class BankRulesInitialize extends BankRulesEvent {
  final String token;
  BankRulesInitialize({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'BankRulesInitialize { token: $token }';
}
