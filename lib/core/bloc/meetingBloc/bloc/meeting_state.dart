part of 'meeting_bloc.dart';

abstract class MeetingState extends Equatable {
  const MeetingState();

  @override
  List<Object> get props => [];
}

class MeetingInitial extends MeetingState {}

class MeetingLoading extends MeetingState {}

class MeetingLoaded extends MeetingState {
  MeetingLoaded({@required this.infoMeeting});
  final MeetingModel infoMeeting;

  @override
  List<Object> get props => [infoMeeting];
}

class MeetingFailure extends MeetingState {}
