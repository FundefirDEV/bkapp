part of 'time_line_shares_bloc.dart';

abstract class TimeLineSharesEvent extends Equatable {
  const TimeLineSharesEvent();

  @override
  List<Object> get props => [];
}

class TimeLineSharesInitialize extends TimeLineSharesEvent {
  TimeLineSharesInitialize({this.token});
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'TimeLineSharesInitialize { token: $token }';
}
