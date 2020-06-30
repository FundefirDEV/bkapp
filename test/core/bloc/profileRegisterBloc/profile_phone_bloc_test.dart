import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_phone_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfilePhoneBloc phoneBloc;

  setUp(() {
    phoneBloc = ProfilePhoneBloc();
  });

  test('Test name bloc', () {
    phoneBloc.onSubmitting();
    phoneBloc.emitSuccess();
    expect(phoneBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    phoneBloc?.close();
  });
}
