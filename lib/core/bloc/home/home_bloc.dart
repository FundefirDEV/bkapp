import 'dart:async';

import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/home_repository.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/partner_repository.dart';
import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.homeRepository, @required this.partnerRepository})
      : super(HomeInitial());
  final HomeRepository homeRepository;
  final PartnerRepository partnerRepository;

  PartnerDatabaseProvider pendingPartnerDb = PartnerDatabaseProvider.db;
  ActivePartnersDbProvider activePartnersDb = ActivePartnersDbProvider.db;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialize) {
      yield HomeLoading();

      try {
        final response = await homeRepository.detailBank(event.token);
        BankInfoModel bankInfo = bankInfoFromJson(response);

        var getPartnersFromDb = await activePartnersDb.getAllParters();
        yield* _savePartnersIntoDb(event, getPartnersFromDb);

        yield HomeLoaded(bkInformation: bankInfo);
      } catch (e) {
        yield HomeFailure(error: e.toString());
      }
    }
  }

  Stream<HomeState> _savePartnersIntoDb(
      HomeInitialize event, List<PartnerModel> getPartnersFromDb) async* {
    if (getPartnersFromDb.length == 0) {
      try {
        final partnerResponse =
            await partnerRepository.getPartners(event.token);
        pendingPartnerDb.deleteAllPartners();
        activePartnersDb.deleteAllPartners();
        for (var partner in partnerResponse) {
          if (!partner["isActive"]) {
            pendingPartnerDb.addPartnerToDatabase(PartnerModel(
                firstname: partner["name"],
                phone: partner["phone"],
                isActive: false,
                role: partner["role"]));
          } else {
            activePartnersDb.addPartnerToDatabase(PartnerModel(
                firstname: partner["name"],
                phone: partner["phone"],
                isActive: true,
                role: partner["role"]));
          }
        }
      } catch (e) {
        yield HomeFailure(error: e.toString());
      }
    }
  }
}
