part of 'meeting_bloc.dart';

abstract class MeetingState extends Equatable {
  const MeetingState();

  @override
  List<Object> get props => [];
}

class MeetingInitial extends MeetingState {}

class MeetingLoading extends MeetingState {}

class MeetingLoaded extends MeetingState {
  MeetingLoaded({
    @required this.infoMeeting,
    @required this.isClosedMeeting,
    @required this.meetingDetail,
    @required this.sharesCurrent,
    @required this.closeMettingActivate,
  });
  final MeetingModel infoMeeting;
  final bool isClosedMeeting;
  final MeetingDetail meetingDetail;
  final SharesCurrentModel sharesCurrent;
  final bool closeMettingActivate;
  @override
  List<Object> get props => [infoMeeting, isClosedMeeting];
}

class MeetingFailure extends MeetingState {
  MeetingFailure({@required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
