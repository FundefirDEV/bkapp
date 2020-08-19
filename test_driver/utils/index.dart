import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

import '../helpers.dart';

loginProcess(FlutterDriver driver) async {
  final inputUsername = findByKey('input-username');
  final inputPassword = findByKey('input-password');
  final userName = Platform.environment['USER_NAME'] ?? 'prueba@gmail.com';
  final userPassword = Platform.environment['USER_PASSWORD'] ?? '123456';
  print(userName);
  await type(inputUsername, userName, driver);
  await type(inputPassword, userPassword, driver);

  await tap(findByKey('raisedButton-accept'), driver);
  await driver.waitFor(findByKey('tab-my-bk'));
}

logoutProcess(FlutterDriver driver) async {
  await tap(findByKey('button-logout'), driver);
  await driver.waitFor(findByKey('input-username'));
}
