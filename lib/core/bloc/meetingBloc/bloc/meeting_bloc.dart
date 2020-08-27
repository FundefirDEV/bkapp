import 'dart:async';
import 'package:bkapp_flutter/core/models/meeting_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/meeting_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc({@required this.repository}) : super(MeetingInitial());
  final MeetingRepository repository;

  @override
  Stream<MeetingState> mapEventToState(
    MeetingEvent event,
  ) async* {
    if (event is MeetingInitialize) {
      yield MeetingLoading();
      try {
        final response = await repository.infoMeeting(event.token);
        final infoMeeting = MeetingModel.fromJson(response);
        yield MeetingLoaded(infoMeeting: infoMeeting);
      } catch (e) {
        yield MeetingFailure();
      }
    }
    if (event is MeetingClosed) {
      yield MeetingLoading();
      try {
        final response = await repository.generateMeetingClosed(event.token);
        final infoMeeting = MeetingModel.fromJson(response);
        yield MeetingLoaded(infoMeeting: infoMeeting);
      } catch (e) {
        yield MeetingFailure();
      }
    }
  }
}