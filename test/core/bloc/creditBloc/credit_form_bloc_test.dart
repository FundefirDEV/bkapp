import 'package:bkapp_flutter/core/bloc/creditBloc/credit_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  CreditFormBloc creditBloc;

  setUp(() {
    creditBloc = CreditFormBloc();
  });

  test('Test number action bloc', () {
    creditBloc.onSubmitting();
    expect(creditBloc.state, isA<FormBlocLoading>());
  });

  tearDown(() {
    creditBloc?.close();
  });
}
