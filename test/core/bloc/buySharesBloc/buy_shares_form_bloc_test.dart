import 'package:bkapp_flutter/core/bloc/buySharesBloc/buy_shares_form_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:test/test.dart';

void main() {
  BuySharesFormBloc buySharesBloc;

  setUp(() {
    buySharesBloc = BuySharesFormBloc();
  });

  test('Test number action bloc', () {
    buySharesBloc.onSubmitting();
    expect(buySharesBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    buySharesBloc?.close();
  });
}
