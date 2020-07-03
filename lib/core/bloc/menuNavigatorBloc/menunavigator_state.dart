part of 'menunavigator_bloc.dart';

abstract class MenuNavigatorState extends Equatable {
  const MenuNavigatorState();

  @override
  List<Object> get props => [];
}

class MenuNavigatorInitial extends MenuNavigatorState {}

class MenuNavigatorLoading extends MenuNavigatorState {}

class MenuNavigatorLoaded extends MenuNavigatorState {}
