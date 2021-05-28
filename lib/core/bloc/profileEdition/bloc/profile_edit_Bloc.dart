import 'dart:async';

import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileEditRepository repository;
  ProfileEditBloc({@required this.repository}) : super(ProfileEditInitial());

  @override
  Stream<ProfileEditState> mapEventToState(
    ProfileEditEvent event,
  ) async* {
    if (event is ProfileEditInitialize) {
      yield ProfileEditLoading();
      try {
        final response = await repository.getProfile(event.token);
        ProfileModel profileModel = profileModelFromJson(response);
        yield ProfileEditLoaded(profileModel: profileModel);
      } catch (e) {
        yield ProfileEditFailure(error: e.toString());
      }
    }
  }
}
