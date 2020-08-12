part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialize extends HomeEvent {
  final String token;
  HomeInitialize({this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'HomeInitialize { token: $token }';
}
