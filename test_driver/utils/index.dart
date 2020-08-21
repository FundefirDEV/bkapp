import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:mock_data/mock_data.dart';

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

Future registerNewUserAndBankProcess(
    FlutterDriver driver,
    String gender,
    String namePerson,
    String secondName,
    String email,
    String phone,
    String name) async {
  await Utils.enterToRegisterFlow(driver);

  await Utils.selectGenderScreen(driver, gender);
  await Utils.fillNamesOfUser(driver, namePerson, secondName);
  await tap(findByKey('buttonNextStep'), driver);

  await Utils.fillEmail(driver, email);
  await tap(findByKey('buttonNextStep'), driver);

  await Utils.selectCountryAndSetPhone(driver, phone);
  await tap(findByKey('buttonNextStep'), driver);

  await Utils.enterPinDataCode(driver);

  await Utils.setPassword(driver);
  await tap(findByKey('buttonNextStep'), driver);

  await Utils.validateDataProfileCreated(driver);
  await tap(findByKey('buttonNextStep'), driver);

  await Utils.selectStateCity(driver);
  await tap(findByKey('inkwell-select-city-redirect'), driver);

  await driver.waitFor(findByKey('inkwell-next-page-redirect'));
  await tap(findByKey('inkwell-next-page-redirect'), driver);

  await Utils.setBankNameAndContinue(driver, name);
  sleep(Duration(seconds: 1));
  await tap(findByKey('buttonNextStep'), driver);

  sleep(Duration(seconds: 2));

  await loginProcess(driver, username: email, password: '123456');
  sleep(Duration(seconds: 1));

  await tap(findByKey('utils-bottom-bar-item'), driver);
  sleep(Duration(seconds: 1));
}

class Utils {
  static String getGender() {
    final option = mockInteger(1, 3);
    switch (option) {
      case 1:
        return "female";
      case 2:
        return "male";
      case 3:
        return "other";
        break;
      default:
        return "female";
    }
  }

  static String getNameByGender(String gender) {
    switch (gender) {
      case "female":
        return mockName('female');
        break;
      case "male":
        return mockName('male');
        break;
      case "other":
        return mockName();
        break;
      default:
        return "Pepito";
    }
  }

  static Future setBankNameAndContinue(
      FlutterDriver driver, String name) async {
    await driver.waitFor(findByKey('input-namebk'));
    await type(findByKey('input-namebk'), name, driver);
    await tap(findByKey('flatbutton-create-bk'), driver);
  }

  static Future selectStateCity(FlutterDriver driver) async {
    await driver.waitFor(findByKey('list-state'));
    await driver.waitFor(findByKey('list-city'));
  }

  static Future validateDataProfileCreated(FlutterDriver driver) async {
    await driver.waitFor(findByKey('register-profile-created-subtitle'));
    await driver.waitFor(findByKey('register-profile-created-fullname'));
    await driver.waitFor(findByKey('register-profile-created-email'));
    await driver.waitFor(findByKey('register-profile-created-phone'));
    await driver
        .waitFor(findByKey('register-profile-created-message-confirmation'));
  }

  static Future setPassword(FlutterDriver driver) async {
    await type(findByKey('input-register-password'), '123456', driver);
    await type(
        findByKey('input-register-password-confirmation'), '123456', driver);
  }

  static Future enterPinDataCode(FlutterDriver driver) async {
    await driver.waitFor(findByKey('input-code-pin-code-temporal'));
    await type(findByKey('input-code-pin-code-temporal'), '12345', driver);
    await driver.waitFor(findByKey('input-register-password'));
  }

  static Future selectCountryAndSetPhone(
      FlutterDriver driver, String phone) async {
    await driver.waitFor(findByKey('country1'));
    await tap(findByKey('country1'), driver);
    await type(findByKey('phone-input-field'), phone, driver);
  }

  static Future fillEmail(FlutterDriver driver, String email) async {
    await type(findByKey('text-field-email-profile-register'), email, driver);
    await tap(findByKey('text-field-email-profile-register'), driver);
    await tap(findByKey('text-field-email-profile-register'), driver);
  }

  static Future fillNamesOfUser(
      FlutterDriver driver, String name, String secondName) async {
    await type(findByKey('input-register-first-name'), name, driver);
    await type(findByKey('input-register-second-name'), secondName, driver);
    await tap(findByKey('input-register-first-name'), driver);
    await driver.waitFor(findByKey('buttonNextStep'));
  }

  static Future selectGenderScreen(FlutterDriver driver, String gender) async {
    await driver.waitFor(findByKey('genderImage-$gender'));
    await tap(findByKey('genderImage-$gender'), driver);
  }

  static Future enterToRegisterFlow(FlutterDriver driver) async {
    await enterNewUser(driver);
    await selectRegisterMyBkAccount(driver);
    await enterToCustomisedFlow(driver);
  }

  static Future enterNewUser(FlutterDriver driver) async {
    await tap(findByKey('flatButton-cancel'), driver);
  }

  static Future selectRegisterMyBkAccount(FlutterDriver driver) async {
    await tap(findByKey('itemCarousel-create-bk'), driver);
  }

  static Future enterToCustomisedFlow(FlutterDriver driver) async {
    await tap(findByKey('register_button2'), driver);
  }
}
