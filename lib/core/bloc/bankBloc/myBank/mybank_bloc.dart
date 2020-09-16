import 'dart:async';

import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/bank_rules_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'mybank_event.dart';
part 'mybank_state.dart';

class MyBankBloc extends Bloc<MyBankEvent, MyBankState> {
  MyBankBloc({@required this.myBankRepository, @required this.rulesRepository})
      : super(MyBankInitial());
  final MyBankRepository myBankRepository;
  final BankRulesRepository rulesRepository;

  @override
  Stream<MyBankState> mapEventToState(
    MyBankEvent event,
  ) async* {
    if (event is GetMyBankInfo) {
      yield MyBankLoading();
      try {
        final response = await myBankRepository.getMyBankInfo(event.token);
        final rules = await rulesRepository.getBankRules(event.token);

        MyBankModel myBankModel = myBankModelFromJson(response)
          ..bankRulesModel = bankRulesFromJson(rules);
        yield MyBankLoaded(data: myBankModel);
      } catch (e) {
        yield MyBankFailure();
      }
    }
  }
}
