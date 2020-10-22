part of 'time_line_credit_bloc.dart';

abstract class TimeLineCreditEvent extends Equatable {
  const TimeLineCreditEvent();

  @override
  List<Object> get props => [];
}

class TimeLineCreditInitialize extends TimeLineCreditEvent {
  TimeLineCreditInitialize({this.token});
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'TimeLineCreditInitialize { token: $token }';
}
