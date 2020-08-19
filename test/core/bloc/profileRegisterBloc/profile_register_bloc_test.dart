import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfileRegisterBloc phoneRegisterBloc;

  setUp(() {
    phoneRegisterBloc = ProfileRegisterBloc(repository: null);
  });

  test('Test name bloc', () {
    phoneRegisterBloc.onSubmitting();
    expect(phoneRegisterBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    phoneRegisterBloc?.close();
  });
}
