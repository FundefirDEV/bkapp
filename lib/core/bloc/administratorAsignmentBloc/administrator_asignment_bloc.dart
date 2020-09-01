import 'dart:async';

import 'package:bkapp_flutter/core/models/administrator_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'administrator_asignment_event.dart';
part 'administrator_asignment_state.dart';

class AdministratorAsignmentBloc
    extends Bloc<AdministratorAsignmentEvent, AdministratorAsignmentState> {
  final AdministratorRepository repository;
  AdministratorAsignmentBloc({@required this.repository})
      : super(AdministratorAsignmentInitial());
  @override
  Stream<AdministratorAsignmentState> mapEventToState(
    AdministratorAsignmentEvent event,
  ) async* {
    if (event is AdministratorAsignmentInitialize) {
      yield AdministratorAsignmentLoading();
      try {
        final response = await repository.getPartners(event.token);
        List<dynamic> administratorModel = administratorModelFromJson(response);
        yield AdministratorAsignmentLoaded(
            partner: response, administratorModel: administratorModel);
      } catch (e) {
        print(e);
        yield AdministratorAsignmentFailure();
      }
    }
    if (event is AdministratorAsignmentPost) {
      yield AdministratorAsignmentLoading();
      try {
        await repository.postAdmin(
            event.token, event.name, event.phone, event.partnerType);
        add(AdministratorAsignmentInitialize(token: event.token));
      } catch (e) {
        yield AdministratorAsignmentFailure();
      }
    }
  }
}
