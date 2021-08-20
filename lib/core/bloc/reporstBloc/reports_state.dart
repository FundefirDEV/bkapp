part of 'reports_bloc.dart';

abstract class ReportsState extends Equatable {
  const ReportsState();

  @override
  List<Object> get props => [];
}

class ReportsInitial extends ReportsState {}

class ReportsLoading extends ReportsState {}

class ReportsLoaded extends ReportsState {
  final ReportsModel reportsModel;

  ReportsLoaded({this.reportsModel});

  @override
  List<Object> get props => [reportsModel];
}

class ReportsFailure extends ReportsState {
  ReportsFailure({this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
