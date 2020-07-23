import 'package:bkapp_flutter/core/bloc/rulesEdition/rules_edit_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  RulesEditFormBloc rulesEditionBloc;

  setUp(() {
    rulesEditionBloc = RulesEditFormBloc();
  });

  test('Test number action bloc', () {
    rulesEditionBloc.onSubmitting();
    expect(rulesEditionBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    rulesEditionBloc?.close();
  });
}
