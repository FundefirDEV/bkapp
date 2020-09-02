import 'dart:async';

import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'mybank_event.dart';
part 'mybank_state.dart';

class MyBankBloc extends Bloc<MyBankEvent, MyBankState> {
  MyBankBloc({
    @required this.repository
  }) : super(MyBankInitial());
  final MyBankRepository repository;

  @override
  Stream<MyBankState> mapEventToState(
    MyBankEvent event,
  ) async* {
    if (event is GetMyBankInfo) {
      yield MyBankLoading();
      try {
        final response = await repository.getMyBankInfo(event.token);
        MyBankModel myBankModel = myBankModelFromJson(response);
        yield MyBankLoaded(data: myBankModel);
      } catch(e) {
        yield MyBankFailure();
      }
    }
  }
}
