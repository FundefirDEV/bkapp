import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_pin_code_verification_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  ProfilePinCodeVerificationBloc pincode;

  setUp(() {
    pincode = ProfilePinCodeVerificationBloc();
  });

  test('Test name bloc', () {
    pincode.onSubmitting();
    expect(pincode.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    pincode?.close();
  });
}
