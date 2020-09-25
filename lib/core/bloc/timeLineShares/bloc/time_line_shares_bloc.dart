import 'dart:async';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_line_shares_event.dart';
part 'time_line_shares_state.dart';

class TimeLineSharesBloc
    extends Bloc<TimeLineSharesEvent, TimeLineSharesState> {
  TimeLineSharesBloc() : super(TimeLineSharesInitial());

  @override
  Stream<TimeLineSharesState> mapEventToState(
    TimeLineSharesEvent event,
  ) async* {
    if (event is TimeLineSharesInitialize) {
      yield TimeLineSharesLoading();
      try {
        TimeLineShares model = TimeLineShares();
        model.shares = '47';
        Date date = Date();
        date.shares = '25';
        date.date = '01/01/2018';
        model.dates = List<Date>();
        model.dates.add(date);
        date = Date();
        date.shares = '22';
        date.date = '01/01/2019';
        model.dates.add(date);
        yield TimeLineSharesLoaded(timeLineShares: model);
      } catch (e) {
        yield TimeLineSharesFailure(error: e.toString());
      }
    }
  }
}
