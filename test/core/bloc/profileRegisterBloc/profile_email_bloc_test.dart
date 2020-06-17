import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_email_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfileEmailBloc emailBloc;

  setUp(() {
    emailBloc = ProfileEmailBloc();
  });

  test('Test email bloc', () {
    emailBloc.onSubmitting();
    expect(emailBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    emailBloc?.close();
  });
}
