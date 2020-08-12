import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'helpers.dart';

void main() {
  FlutterDriver driver;
  // driver.

  group('On boarding', () {
    final inputUsername = findByKey('input-username');
    final inputPassword = findByKey('input-password');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Write username', () async {
      await type(inputUsername, 'prueba@gmail.com', driver);
      // await driver.waitFor(find.text('prueba@gmail.com'));
      // expect(find.text('prueba@gmail.com'), isNotNull);
    });

    test('Write password', () async {
      await type(inputPassword, '123456', driver);
      // await driver.waitFor(find.text('123456'));
      // expect(find.text('123456'), isNotNull);
    });

    test('login', () async {
      await tap(findByKey('raisedButton-accept'), driver);
      sleep(Duration(seconds: 10));
    });
  });
}
