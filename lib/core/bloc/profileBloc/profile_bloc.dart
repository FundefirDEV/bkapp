import 'dart:async';

import 'package:bkapp_flutter/core/models/profile_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;
  ProfileBloc({@required this.repository}) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileInitialize) {
      yield ProfileLoading();
      try {
        final response = await repository.getProfile(event.token);
        ProfileModel profileModel = profileModelFromJson(response);
        yield ProfileLoaded(profileModel: profileModel);
      } catch (e) {
        yield ProfileFailure(error: e.toString());
      }
    }
  }
}
