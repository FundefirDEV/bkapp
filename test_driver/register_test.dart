import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'helpers.dart';

void main() async {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('Creation bank process', () async {
    await _enterToRegisterFlow(driver);

    await _selectGenderScreen(driver);
    await _fillNamesOfUser(driver);
    await tap(findByKey('buttonNextStep'), driver);

    await _fillEmail(driver);
    await tap(findByKey('buttonNextStep'), driver);

    await _selectCountryAndSetPhone(driver);
    await tap(findByKey('buttonNextStep'), driver);

    await _enterPinDataCode(driver);

    await _setPassword(driver);
    await tap(findByKey('buttonNextStep'), driver);

    await _validateDataProfileCreated(driver);
    await tap(findByKey('buttonNextStep'), driver);

    await _selectStateCity(driver);
    await tap(findByKey('inkwell-select-city-redirect'), driver);

    await driver.waitFor(findByKey('inkwell-next-page-redirect'));
    await tap(findByKey('inkwell-next-page-redirect'), driver);

    await _setBankNameAndContinue(driver);

    sleep(Duration(seconds: 10));

    expect(true, true);
  });
}

Future _setBankNameAndContinue(FlutterDriver driver) async {
  await driver.waitFor(findByKey('input-namebk'));
  await type(findByKey('input-namebk'), 'Mi super grupo', driver);
  await tap(findByKey('flatbutton-create-bk'), driver);
}

Future _selectStateCity(FlutterDriver driver) async {
  await driver.waitFor(findByKey('list-state'));
  // await tap(findByKey('list-state'), driver);

  await driver.waitFor(findByKey('list-city'));
}

Future _validateDataProfileCreated(FlutterDriver driver) async {
  await driver.waitFor(findByKey('register-profile-created-subtitle'));
  await driver.waitFor(findByKey('register-profile-created-fullname'));
  await driver.waitFor(findByKey('register-profile-created-email'));
  await driver.waitFor(findByKey('register-profile-created-phone'));
  await driver
      .waitFor(findByKey('register-profile-created-message-confirmation'));
}

Future _setPassword(FlutterDriver driver) async {
  await type(findByKey('input-register-password'), '123456', driver);
  await type(
      findByKey('input-register-password-confirmation'), '123456', driver);
}

Future _enterPinDataCode(FlutterDriver driver) async {
  await driver.waitFor(findByKey('input-code-pin-code-temporal'));
  await type(findByKey('input-code-pin-code-temporal'), '12345', driver);
  await driver.waitFor(findByKey('input-register-password'));
}

Future _selectCountryAndSetPhone(FlutterDriver driver) async {
  await driver.waitFor(findByKey('country1'));
  await tap(findByKey('country1'), driver);
  await type(findByKey('phone-input-field'), '(317) 656-9888', driver);
}

Future _fillEmail(FlutterDriver driver) async {
  await type(findByKey('text-field-email-profile-register'),
      'juanita12@gmail.com', driver);
  await tap(findByKey('text-field-email-profile-register'), driver);
  await tap(findByKey('text-field-email-profile-register'), driver);
}

Future _fillNamesOfUser(FlutterDriver driver) async {
  await type(findByKey('input-register-first-name'), 'Juanita', driver);
  await type(findByKey('input-register-second-name'), 'Acosta', driver);
  await tap(findByKey('input-register-first-name'), driver);
  await driver.waitFor(findByKey('buttonNextStep'));
}

Future _selectGenderScreen(FlutterDriver driver) async {
  await driver.waitFor(findByKey('genderImage-female'));
  await tap(findByKey('genderImage-female'), driver);
}

Future _enterToRegisterFlow(FlutterDriver driver) async {
  await _enterNewUser(driver);
  await _selectRegisterMyBkAccount(driver);
  await _enterToCustomisedFlow(driver);
}

Future _enterNewUser(FlutterDriver driver) async {
  await tap(findByKey('flatButton-cancel'), driver);
}

Future _selectRegisterMyBkAccount(FlutterDriver driver) async {
  await tap(findByKey('itemCarousel-create-bk'), driver);
}

Future _enterToCustomisedFlow(FlutterDriver driver) async {
  await tap(findByKey('register_button2'), driver);
}
