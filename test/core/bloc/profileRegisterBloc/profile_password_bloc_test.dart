import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_password_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfilePasswordBloc passwordBloc;

  setUp(() {
    passwordBloc = ProfilePasswordBloc();
  });

  test('Test name bloc', () {
    passwordBloc.onSubmitting();
    expect(passwordBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    passwordBloc?.close();
  });
}

