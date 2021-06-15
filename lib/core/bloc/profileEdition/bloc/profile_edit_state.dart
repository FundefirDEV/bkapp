part of 'profile_edit_Bloc.dart';

abstract class ProfileEditState extends Equatable {
  const ProfileEditState();

  @override
  List<Object> get props => [];
}

class ProfileEditInitial extends ProfileEditState {}

class ProfileEditLoading extends ProfileEditState {}

class ProfileEditLoaded extends ProfileEditState {
  final ProfileModel profileModel;

  ProfileEditLoaded({this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class ProfileEditFailure extends ProfileEditState {
  ProfileEditFailure({this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
