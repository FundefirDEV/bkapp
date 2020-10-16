import 'dart:async';

import 'package:bkapp_flutter/core/models/time_line_credit_model.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_line_credit_event.dart';
part 'time_line_credit_state.dart';

class TimeLineCreditBloc
    extends Bloc<TimeLineCreditEvent, TimeLineCreditState> {
  TimeLineCreditBloc() : super(TimeLineCreditInitial());

  @override
  Stream<TimeLineCreditState> mapEventToState(
    TimeLineCreditEvent event,
  ) async* {
    if (event is TimeLineCreditInitialize) {
      yield TimeLineCreditLoading();
      try {
        final response = await homeRepository.myCredits(event.token);
        final myCredit = TimeLineCreditModel.fromJson(response);
        yield TimeLineCreditLoaded(timeLineCredit: myCredit);
      } catch (e) {
        yield TimeLineCreditFailure(error: e.toString());
      }
    }
  }
}
