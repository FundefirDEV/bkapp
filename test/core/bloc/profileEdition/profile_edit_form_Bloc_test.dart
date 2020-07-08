import 'package:bkapp_flutter/core/bloc/profileEdition/profile_edit_form_Bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfileEditFormBloc profileEditFormBloc;

  setUp(() {
    profileEditFormBloc = ProfileEditFormBloc();
  });

  test('Test profile edition form bloc', () {
    profileEditFormBloc.onSubmitting();
    profileEditFormBloc.state.toSuccess();
    expect(profileEditFormBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    profileEditFormBloc?.close();
  });
}
