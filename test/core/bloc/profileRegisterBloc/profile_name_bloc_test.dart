import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_name_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfileNameBloc nameBloc;

  setUp(() {
    nameBloc = ProfileNameBloc();
  });

  test('Test name bloc', () {
    nameBloc.onSubmitting();
    expect(nameBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    nameBloc?.close();
  });
}
