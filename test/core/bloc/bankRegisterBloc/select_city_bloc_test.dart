import 'package:bkapp_flutter/core/bloc/bankRegisterBloc/select_city_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  SelectCityBloc selectCityBloc;

  setUp(() {
    selectCityBloc = SelectCityBloc();
  });

  test('Test number action bloc', () {
    selectCityBloc.onSubmitting();
    expect(selectCityBloc.state, isA<FormBlocLoading>());
  });

  tearDown(() {
    selectCityBloc?.close();
  });
}
