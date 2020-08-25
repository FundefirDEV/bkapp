import 'dart:async';
import 'package:bkapp_flutter/core/models/bank_rules_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/bank_rules_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bank_rules_event.dart';
part 'bank_rules_state.dart';

class BankRulesBloc extends Bloc<BankRulesEvent, BankRulesState> {
  final BankRulesRepository repository;
  BankRulesBloc({this.repository}) : super(BankRulesInitial());

  @override
  Stream<BankRulesState> mapEventToState(
    BankRulesEvent event,
  ) async* {
    if (event is BankRulesInitialize) {
      yield BankRulesLoading();
      try {
        final response = await repository.getBankRules(event.token);
        BankRulesModel approvalsModel = bankRulesFromJson(response);
        yield BankRulesLoaded(
            bankRules: response, bankRulesModel: approvalsModel);
      } catch (e) {
        yield BankRulesFailure();
      }
    }
  }
}
