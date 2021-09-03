part of 'reports_bloc.dart';

abstract class ReportsEvent extends Equatable {
  const ReportsEvent();

  @override
  List<Object> get props => [];
}

class ReportsInitialize extends ReportsEvent {
  final String token;
  ReportsInitialize({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'ReportsInitialize { token: $token }';
}
