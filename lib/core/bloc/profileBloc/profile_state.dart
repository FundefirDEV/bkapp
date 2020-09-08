part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;

  ProfileLoaded({this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class ProfileFailure extends ProfileState {}
