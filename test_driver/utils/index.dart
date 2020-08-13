import 'package:flutter_driver/flutter_driver.dart';

import '../helpers.dart';

loginProcess(FlutterDriver driver) async {
  final inputUsername = findByKey('input-username');
  final inputPassword = findByKey('input-password');
  const String USER_NAME =
      String.fromEnvironment('USER_NAME', defaultValue: "prueba@gmail.com");
  const String USER_PASSWORD =
      String.fromEnvironment('USER_PASSWORD', defaultValue: "123456");
  await type(inputUsername, USER_NAME, driver);
  await type(inputPassword, USER_PASSWORD, driver);

  await tap(findByKey('raisedButton-accept'), driver);
  await driver.waitFor(findByKey('tab-my-bk'));
}
