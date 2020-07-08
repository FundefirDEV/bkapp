import 'package:bkapp_flutter/core/bloc/nameBkBloc/name_bk_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  NameBkBloc namebk;

  setUp(() {
    namebk = NameBkBloc();
  });

  test('Test name bk bloc', () {
    namebk.onSubmitting();
    expect(namebk.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    namebk?.close();
  });
}
