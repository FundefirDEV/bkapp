part of 'profile_edit_Bloc.dart';

abstract class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();

  @override
  List<Object> get props => [];
}

class ProfileEditInitialize extends ProfileEditEvent {
  final String token;
  ProfileEditInitialize({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'ProfileEditInitialize { token: $token }';
}
