import 'package:bkapp_flutter/core/bloc/creditBloc/credit_form_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/credit_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class CreditRepoMock extends Mock implements CreditRepository {}

void main() {
  CreditFormBloc creditBloc;
  CreditRepository creditRepoMock = CreditRepoMock();

  setUp(() {
    creditBloc = CreditFormBloc(creditRepository: creditRepoMock);
  });

  test('Test number action bloc', () {
    creditBloc.onSubmitting();
    expect(creditBloc.state, isA<FormBlocLoaded>());
  });

  tearDown(() {
    creditBloc?.close();
  });
}
