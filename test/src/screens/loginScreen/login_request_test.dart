import 'package:bkapp_flutter/core/services/repositories/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('Assert login repository should return an assertion error', () {
    expect(() => LoginRepository(apiProvider: null),
        throwsA(isA<AssertionError>()));
  });
}
