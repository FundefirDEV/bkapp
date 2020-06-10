import 'dart:convert';

import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements HttpClientAdapter {}
void main() {
  LoginRepository repository = LoginRepository(
    apiProvider: ApiProvider(
      httpClient: new Dio(),
    )
  );

  final Map<String, dynamic> token = {
    'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
    'expiration': 15671231232
  };

  group('Test login requests', () {
    test('Test Login POST request should return 200', () async {
        final Dio tdio = Dio();
        final mockClient = MockClient();
        tdio.httpClientAdapter = mockClient;
        final ApiProvider tapi = ApiProvider.test(httpClient: tdio);

        final responsepayload = jsonEncode({"response_code": "200"});
        final httpResponse = ResponseBody.fromString(
          responsepayload,
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(mockClient.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

        final response = await tapi.getTokenLogin("test@gmail.com", "xxxxx");
        final expected = {"response_code": "200"};

        expect(response, equals(expected));
      });

    test('Login response has to be a token', () async {
      var request = await repository.postLogin(
        username: 'data@gmail.com',
        password: 'xxxxx'
      );
      expect(request, token);
    });

    test('Assert login repository should return an assertion error', () {
      expect(() => 
        LoginRepository(apiProvider: null),
        throwsA(isA<AssertionError>())
      );
    });
  });
}
