import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_phone_bloc.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../base_tester.dart';

class MockClient extends Mock implements HttpClientAdapter {}

void main() {
  ProfilePhoneBloc phoneBloc;
  final RegisterPhoneStepArgs data =
      RegisterPhoneStepArgs('male', 'assets/images/man.svg');

  final Dio tdio = Dio();
  final mockClient = MockClient();
  tdio.httpClientAdapter = mockClient;
  final ValidationCodeRepository tapi =
      ValidationCodeRepository.test(apiProvider: ApiProvider(httpClient: tdio));

  setUp(() {
    phoneBloc = ProfilePhoneBloc(repository: tapi);
  });

  test('Assert ValidationCode should return an assertion error', () {
    expect(() => ValidationCodeRepository(apiProvider: null),
        throwsA(isA<AssertionError>()));
  });

  testWidgets('Test onSubmitting eventListener Phone',
      (WidgetTester tester) async {
    final testKey = Key('my-id');
    await tester.pumpWidget(
        baseTester(child: RegisterPhoneStepScreen(key: testKey, data: data)));
    await tester.pumpAndSettle();

    phoneBloc.onSubmitting();
    await tester.pumpAndSettle(Duration(seconds: 3));
    expect(phoneBloc.state, isInstanceOf<FormBlocLoaded>());
  });
}
