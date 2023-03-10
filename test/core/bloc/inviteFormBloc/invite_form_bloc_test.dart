import 'package:bkapp_flutter/core/bloc/partnersBloc/invite_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  InviteFormBloc inviteFormBloc;

  setUp(() {
    inviteFormBloc = InviteFormBloc(partnerRepository: null);
  });

  test('Test invite form bloc', () {
    inviteFormBloc.onSubmitting();
    expect(inviteFormBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    inviteFormBloc?.close();
  });
}
