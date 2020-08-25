part of 'bank_rules_bloc.dart';

abstract class BankRulesState extends Equatable {
  const BankRulesState();

  @override
  List<Object> get props => [];
}

class BankRulesInitial extends BankRulesState {}

class BankRulesLoading extends BankRulesState {}

class BankRulesLoaded extends BankRulesState {
  final Map bankRules;
  final BankRulesModel bankRulesModel;

  BankRulesLoaded({this.bankRulesModel, @required this.bankRules});

  @override
  List<Object> get props => [bankRules];
}

class BankRulesFailure extends BankRulesState {}
