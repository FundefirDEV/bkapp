import 'dart:async';

import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/reports_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final ReportsRepository repository;
  ReportsBloc({@required this.repository}) : super(ReportsInitial());

  @override
  Stream<ReportsState> mapEventToState(
    ReportsEvent event,
  ) async* {
    if (event is ReportsInitialize) {
      yield ReportsLoading();
      try {
        final response = await repository.getReports(event.token);
        ReportsModel reportsModel = reportsModelFromJson(response);
        yield ReportsLoaded(reportsModel: reportsModel);
      } catch (e) {
        yield ReportsFailure(error: e.toString());
      }
    }
  }
}
