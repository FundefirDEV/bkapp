import 'dart:async';

import 'package:bkapp_flutter/core/models/bank_info_model.dart';
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
  MyBankBloc({
    @required this.myBankRepository,
    @required this.rulesRepository,
    @required this.homeRepository,
  }) : super(MyBankInitial());
  final MyBankRepository myBankRepository;
  final BankRulesRepository rulesRepository;
  final HomeRepository homeRepository;

  @override
  Stream<MyBankState> mapEventToState(
    MyBankEvent event,
  ) async* {
    if (event is GetMyBankInfo) {
      yield MyBankLoading();
      try {
        final response = await myBankRepository.getMyBankInfo(event.token);
        final rules = await rulesRepository.getBankRules(event.token);
        final bankInformation = await homeRepository.detailBank(event.token);

        MyBankModel myBankModel = myBankModelFromJson(response)
          ..bankRulesModel = bankRulesFromJson(rules);

        BankInfoModel bankInfoModel = bankInfoFromJson(bankInformation);

        yield MyBankLoaded(data: myBankModel, bankInfoModel: bankInfoModel);
      } catch (e) {
        yield MyBankFailure(error: e.toString());
      }
    }
  }
}
