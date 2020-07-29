import 'dart:async';

import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'approvals_event.dart';
part 'approvals_state.dart';

class ApprovalsBloc extends Bloc<ApprovalsEvent, ApprovalsState> {
  final ApprovalsRepository repository;

  ApprovalsBloc({@required this.repository}) : super(ApprovalsInitial());

  @override
  Stream<ApprovalsState> mapEventToState(
    ApprovalsEvent event,
  ) async* {
    if (event is ApprovalsInitialize) {
      yield ApprovalsLoading();

      try {
        final response = await repository.getApprovals();
        yield ApprovalsLoaded(approvals: response);
      } catch (e) {
        yield ApprovalsFailure();
      }
    }
  }
}
