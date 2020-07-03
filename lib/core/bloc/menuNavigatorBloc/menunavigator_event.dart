part of 'menunavigator_bloc.dart';

abstract class MenuNavigatorEvent extends Equatable {
  const MenuNavigatorEvent();

  @override
  List<Object> get props => [];
}

class ButtonUnpressed extends MenuNavigatorEvent {}

class ButtonPressed extends MenuNavigatorEvent {
  final int goTo;
  ButtonPressed({@required this.goTo});

  @override
  List<Object> get props => [goTo];

  @override
  String toString() => 'ButtonPressed { goTo: $goTo }';
}
