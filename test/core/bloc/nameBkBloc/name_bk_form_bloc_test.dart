import 'package:bkapp_flutter/core/bloc/inviteFormBloc/invite_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/nameBkBloc/name_bk_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  NameBkBloc nameBkBloc;

  setUp(() {
    nameBkBloc = NameBkBloc();
  });

  test('Test name bk form bloc', () {
    nameBkBloc.onSubmitting();
    nameBkBloc.state.toSuccess();
    expect(nameBkBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    nameBkBloc?.close();
  });
}
