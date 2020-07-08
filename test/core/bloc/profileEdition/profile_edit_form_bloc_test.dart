import 'package:bkapp_flutter/core/bloc/profileEdition/profile_edit_form_Bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfileEditFormBloc nameProfile;

  setUp(() {
    nameProfile = ProfileEditFormBloc();
  });

  test('Test profile bloc', () {
    nameProfile.onSubmitting();
    expect(nameProfile.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    nameProfile?.close();
  });
}
