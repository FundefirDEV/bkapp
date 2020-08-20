import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

import '../helpers.dart';

loginProcess(FlutterDriver driver, {String password, String username}) async {
  final inputUsername = findByKey('input-username');
  final inputPassword = findByKey('input-password');
  final userNameData = username == null
      ? Platform.environment['USER_NAME'] ?? 'prueba@gmail.com'
      : username;
  final userPassword = password == null
      ? Platform.environment['USER_PASSWORD'] ?? '123456'
      : password;
  print(userNameData);
  print(userPassword);
  await type(inputUsername, userNameData, driver);
  await type(inputPassword, userPassword, driver);

  await tap(findByKey('raisedButton-accept'), driver);
  await driver.waitFor(findByKey('tab-my-bk'));
}

logoutProcess(FlutterDriver driver) async {
  await tap(findByKey('button-logout'), driver);
  await driver.waitFor(findByKey('input-username'));
}
