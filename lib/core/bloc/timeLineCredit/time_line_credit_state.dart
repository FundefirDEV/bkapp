part of 'time_line_credit_bloc.dart';

abstract class TimeLineCreditState extends Equatable {
  const TimeLineCreditState();

  @override
  List<Object> get props => [];
}

class TimeLineCreditInitial extends TimeLineCreditState {}

class TimeLineCreditLoading extends TimeLineCreditState {}

class TimeLineCreditLoaded extends TimeLineCreditState {
  TimeLineCreditLoaded({this.timeLineCredit});
  final timeLineCredit;

  @override
  List<Object> get props => [timeLineCredit];
}

class TimeLineCreditFailure extends TimeLineCreditState {
  TimeLineCreditFailure({this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
