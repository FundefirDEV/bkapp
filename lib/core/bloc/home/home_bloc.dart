import 'dart:async';

import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.repository}) : super(HomeInitial());
  final HomeRepository repository;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialize) {
      yield HomeLoading();

      try {
        final response = await repository.detailBank(event.token);
        BankInfoModel bankInfo = bankInfoFromJson(response);

        yield HomeLoaded(bkInformation: bankInfo);
      } catch (e) {
        yield HomeFailure();
      }
    }
  }
}
