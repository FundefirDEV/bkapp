part of 'meeting_bloc.dart';

abstract class MeetingEvent extends Equatable {
  const MeetingEvent();

  @override
  List<Object> get props => [];
}

class MeetingInitialize extends MeetingEvent {
  MeetingInitialize({@required this.token});
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'MeetingInitialize { token: $token }';
}

class MeetingClosed extends MeetingEvent {
  MeetingClosed({@required this.token});

  final String token;
  @override
  List<Object> get props => [token];

  @override
  String toString() => 'MeetingClosed { token: $token }';
}
