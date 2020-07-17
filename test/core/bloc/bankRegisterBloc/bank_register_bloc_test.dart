import 'package:bkapp_flutter/core/bloc/bankRegisterBloc/bank_register_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  BankRegisterBloc bankRegisterBloc;

  setUp(() {
    bankRegisterBloc = BankRegisterBloc();
  });

  test('Test number action bloc', () {
    bankRegisterBloc.onSubmitting();
    expect(bankRegisterBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    bankRegisterBloc?.close();
  });
}
