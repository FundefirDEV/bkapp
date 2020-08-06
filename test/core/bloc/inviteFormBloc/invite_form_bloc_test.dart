import 'package:bkapp_flutter/core/bloc/bankRegisterBloc/invite_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  InviteFormBloc inviteFormBloc;

  setUp(() {
    inviteFormBloc = InviteFormBloc();
  });

  test('Test invite form bloc', () {
    inviteFormBloc.onSubmitting();
    expect(inviteFormBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    inviteFormBloc?.close();
  });
}
