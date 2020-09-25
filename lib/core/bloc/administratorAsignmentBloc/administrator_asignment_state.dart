part of 'administrator_asignment_bloc.dart';

abstract class AdministratorAsignmentState extends Equatable {
  const AdministratorAsignmentState();

  @override
  List<Object> get props => [];
}

class AdministratorAsignmentInitial extends AdministratorAsignmentState {}

class AdministratorAsignmentLoading extends AdministratorAsignmentState {}

class AdministratorAsignmentLoaded extends AdministratorAsignmentState {
  final List<dynamic> partner;
  final List<dynamic> administratorModel;

  AdministratorAsignmentLoaded(
      {@required this.partner, this.administratorModel});

  @override
  List<Object> get props => [partner, administratorModel];
}

class AdministratorAsignmentFailure extends AdministratorAsignmentState {
  AdministratorAsignmentFailure({@required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
