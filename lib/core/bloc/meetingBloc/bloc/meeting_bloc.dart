import 'dart:async';
import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/core/models/meeting_model.dart';
import 'package:bkapp_flutter/core/models/shares_current_model.dart';
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

        final int totalShares = response['totalShares']; 
        final double totalCredit = response['totalCredit']; 
        final double totalPayment = response['capitalBalance'] + response['totalOrdinaryInterest'];

        final bool closeMettingActivate 
          = activateCloseMettingButton(totalShares , totalCredit , totalPayment);

        final infoMeeting = MeetingModel.fromJson(response);
        final credit = await repository.creditsCurrentMeeting(event.token);
        MeetingDetail meetingDetail = MeetingDetail.fromJson(credit);
        final shares = await repository.sharesCurrentMeeting(event.token);
        print(' ******************* shares ******************* ');
        print(shares);
        print(' ********************************************** ');

        SharesCurrentModel sharesCurrent = SharesCurrentModel.fromJson(shares);
        yield MeetingLoaded(
            infoMeeting: infoMeeting,
            isClosedMeeting: false,
            meetingDetail: meetingDetail,
            sharesCurrent: sharesCurrent,
            closeMettingActivate: closeMettingActivate,);
      } catch (e) {
        yield MeetingFailure(error: e.toString());
      }
    }
    if (event is MeetingClosed) {
      yield MeetingLoading();
      try {
        final response = await repository.generateMeetingClosed(event.token);
        final infoMeeting = MeetingModel.fromJson(response);
        final credit = await repository.creditsCurrentMeeting(event.token);
        MeetingDetail meetingDetail = MeetingDetail.fromJson(credit);
        final shares = await repository.sharesCurrentMeeting(event.token);
        SharesCurrentModel sharesCurrent = SharesCurrentModel.fromJson(shares);

        yield MeetingLoaded(
            infoMeeting: infoMeeting,
            isClosedMeeting: true,
            meetingDetail: meetingDetail,
            sharesCurrent: sharesCurrent,
            closeMettingActivate: false);
      } catch (e) {
        yield MeetingFailure(error: e.toString());
      }
    }
  }

  bool activateCloseMettingButton(
    int totalShares , 
    double totalCredit, 
    double totalPayment){

    return !(totalShares == 0 && totalCredit == 0.0 && totalPayment == 0.0);
  }
}
