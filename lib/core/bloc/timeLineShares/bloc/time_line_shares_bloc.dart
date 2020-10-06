import 'dart:async';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'time_line_shares_event.dart';
part 'time_line_shares_state.dart';

class TimeLineSharesBloc
    extends Bloc<TimeLineSharesEvent, TimeLineSharesState> {
  TimeLineSharesBloc({@required this.homeRepository})
      : super(TimeLineSharesInitial());
  HomeRepository homeRepository;
  @override
  Stream<TimeLineSharesState> mapEventToState(
    TimeLineSharesEvent event,
  ) async* {
    if (event is TimeLineSharesInitialize) {
      yield TimeLineSharesLoading();
      try {
        final response = await homeRepository.myShares(event.token);
        final myShares = TimeLineShares.fromJson(response);
        yield TimeLineSharesLoaded(timeLineShares: myShares);
      } catch (e) {
        yield TimeLineSharesFailure(error: e.toString());
      }
    }
  }
}
