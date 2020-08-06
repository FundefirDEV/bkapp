import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/repositories/approvals_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApprovalsRepository extends Mock implements ApprovalsRepository {}

void main() {
  ApprovalsBloc approvalsBloc;
  ApprovalsRepository approvalsRepository;
  var mockResponse = {
    "cashBalance": 5000000,
    "totalRequestShares": 2000000,
  };

  setUp(() {
    approvalsRepository = MockApprovalsRepository();
    approvalsBloc = ApprovalsBloc(repository: approvalsRepository);
  });

  tearDown(() {
    approvalsBloc?.close();
  });

  group('Test ApprovalsBloc', () {
    test('initial state is correct', () {
      expect(approvalsBloc.state, ApprovalsInitial());
    });

    test('Assert login repository should return an assertion error', () {
      expect(() => ApprovalsRepository(apiProvider: null),
          throwsA(isA<AssertionError>()));
    });
  });

  blocTest<ApprovalsBloc, ApprovalsState>(
    'Test when the user is authenticated',
    build: () {
      when(approvalsRepository.getApprovals())
        .thenAnswer((_) async => mockResponse);
      return ApprovalsBloc(repository: approvalsRepository);
    },
    act: (bloc) => bloc.add(ApprovalsInitialize()),
    expect: [
      ApprovalsLoading(),
      ApprovalsLoaded(approvals: mockResponse)
    ],
  );
}
