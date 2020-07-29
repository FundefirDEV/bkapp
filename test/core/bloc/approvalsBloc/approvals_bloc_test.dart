import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/approvals_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApprovalsRepository extends Mock implements ApprovalsRepository {}

void main() {
  ApprovalsRepository repository = ApprovalsRepository(
      apiProvider: ApiProvider(
    httpClient: new Dio(),
  ));
  ApprovalsBloc approvalsBloc;
  MockApprovalsRepository approvalsRepository;

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
  });

  test('close does not emit new states in approvals', () {
    expectLater(
      approvalsBloc,
      emitsInOrder([ApprovalsInitial(), emitsDone]),
    );
    approvalsBloc.close();
  });

  blocTest(
    'Test when the user is authenticated',
    build: () async => ApprovalsBloc(repository: repository),
    act: (bloc) async => bloc.add(ApprovalsInitialize()),
    expect: [
      ApprovalsLoading(),
      ApprovalsLoaded(approvals: {
        "cashBalance": 5000000,
        "totalRequestShares": 2000000,
        "totalCreditRequest": 300000,
        "totalPaymentRequest": 1500000,
        "sharesRequest": [
          {
            "id": 1,
            "partnerName": "Marcos Nope",
            "amount": 50000,
            "quantity": 5,
            "requestDate": "2020/03/20"
          },
          {
            "id": 2,
            "partnerName": "Daniel Alberto Talanquera",
            "amount": 30000,
            "quantity": 3,
            "requestDate": "2020/03/20"
          },
          {
            "id": 3,
            "partnerName": "Juancho Carancho",
            "amount": 30000,
            "quantity": 3,
            "requestDate": "2020/03/20"
          }
        ],
        "creditRequest": [
          {
            "id": 1,
            "partnerName": "Javier Reyes",
            "amount": 500000,
            "requestDate": "2020/03/20"
          },
          {
            "id": 1,
            "partnerName": "Enrique Angrisano",
            "amount": 700000,
            "requestDate": "2020/04/15"
          }
        ],
        "paymentInstallmentRequest": [
          {
            "id": 1,
            "partnerName": "Sutatino Perencejo",
            "amount": 200000,
            "requestDate": "2020/04/20"
          },
          {
            "id": 1,
            "partnerName": "Enrique Angrisano",
            "amount": 700000,
            "requestDate": "2020/04/15"
          }
        ]
      })
    ],
  );
}
