import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'helpers.dart';
import 'utils/index.dart';

void main() async {
  FlutterDriver driver;

  group('Profile validations', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Validate the profile screen', () async {
      await loginProcess(driver);
      await tap(findByKey('profile-bottom-bar-item'), driver);
      sleep(Duration(seconds: 10));
      await logoutProcess(driver);
      expect(true, true);
    });
  });
}
