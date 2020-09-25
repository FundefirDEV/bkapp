part of 'time_line_shares_bloc.dart';

abstract class TimeLineSharesState extends Equatable {
  const TimeLineSharesState();

  @override
  List<Object> get props => [];
}

class TimeLineSharesInitial extends TimeLineSharesState {}

class TimeLineSharesLoading extends TimeLineSharesState {}

class TimeLineSharesLoaded extends TimeLineSharesState {
  TimeLineSharesLoaded({this.timeLineShares});
  final TimeLineShares timeLineShares;

  @override
  List<Object> get props => [timeLineShares];
}

class TimeLineSharesFailure extends TimeLineSharesState {
  TimeLineSharesFailure({this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
