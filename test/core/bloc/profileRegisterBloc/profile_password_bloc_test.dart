import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfileRegisterBloc passwordBloc;

  setUp(() {
    passwordBloc = ProfileRegisterBloc(repository: null);
  });

  test('Test name bloc', () {
    passwordBloc.onSubmitting();
    expect(passwordBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    passwordBloc?.close();
  });
}
