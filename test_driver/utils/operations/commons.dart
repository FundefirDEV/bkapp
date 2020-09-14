import 'package:flutter_driver/flutter_driver.dart';
import 'package:mock_data/mock_data.dart';

import '../../helpers.dart';
import '../index.dart';
import 'share.dart';

Future registerFlow(FlutterDriver driver, String gender, String namePerson,
    String secondName, String email, String phone) async {
  await _enterToRegisterFlow(driver);

  await _selectGenderScreen(driver, gender);
  await _fillNamesOfUser(driver, namePerson, secondName);
  await tap(findByKey('buttonNextStep'), driver);

  await _fillEmail(driver, email);
  await tap(findByKey('buttonNextStep'), driver);

  await _selectCountryAndSetPhone(driver, phone);
  await tap(findByKey('buttonNextStep'), driver);

  await _enterPinDataCode(driver);

  await _setPassword(driver);
  await tap(findByKey('buttonNextStep'), driver);

  await _validateDataProfileCreated(driver);
  await tap(findByKey('buttonNextStep'), driver);
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

Future _selectCountryAndSetPhone(FlutterDriver driver, String phone) async {
  await driver.waitFor(findByKey('country1'));
  await tap(findByKey('country1'), driver);
  await type(findByKey('phone-input-field'), phone, driver);
}

Future _fillEmail(FlutterDriver driver, String email) async {
  await type(findByKey('text-field-email-profile-register'), email, driver);
  await tap(findByKey('text-field-email-profile-register'), driver);
  await tap(findByKey('text-field-email-profile-register'), driver);
}

Future _fillNamesOfUser(
    FlutterDriver driver, String name, String secondName) async {
  await type(findByKey('input-register-first-name'), name, driver);
  await type(findByKey('input-register-second-name'), secondName, driver);
  await tap(findByKey('input-register-first-name'), driver);
  await driver.waitFor(findByKey('buttonNextStep'));
}

Future _selectGenderScreen(FlutterDriver driver, String gender) async {
  await driver.waitFor(findByKey('genderImage-$gender'));
  await tap(findByKey('genderImage-$gender'), driver);
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

Future invitePartner(
    FlutterDriver driver, String namePartner, String phonePartner) async {
  await tap(findByKey('add-partner-button'), driver);
  await type(findByKey('input_name_invite_modal'), namePartner, driver);
  await type(findByKey('input_phone_invite_modal'), phonePartner, driver);
  await tap(findByKey('input_name_invite_modal'), driver);
  await tap(findByKey('input_phone_invite_modal'), driver);
  await driver.waitFor(findByKey('raisedButton-accept'));

  delay(time: 1);
  await tap(findByKey('raisedButton-accept'), driver);
  delay(time: 1);
}

Future registerPartnerRequestShares(
    FlutterDriver driver,
    String gender,
    String email,
    String namePartner,
    String phonePartner,
    String quantityShareRequested) async {
  await registerFlow(
      driver, gender, namePartner, mockName('male'), email, phonePartner);
  await loginProcess(driver, username: email, password: '123456');

  await createShareRequest(driver, quantityShareRequested);
  delay();
  await goToApprovals(driver);
  delay();
  await validateCardRequestApprovals(driver, quantityShareRequested);
  delay(time: 2);
  await logoutProcess(driver);
}

Future goToUtils(FlutterDriver driver) async {
  await tap(findByKey('utils-bottom-bar-item'), driver);
}

Future goToApprovals(FlutterDriver driver) async {
  await goToUtils(driver);
  await tap(findByKey('util-card-description-row-aprobation'), driver);
}

Future tapButtonPlus(FlutterDriver driver) async {
  await tap(findByKey('button-action-plus'), driver);
}

Future goToAssignAdmin(FlutterDriver driver) async {
  await goToUtils(driver);
  await tap(findByKey('row-content-card-administrator-assign-admin'), driver);
}

Future assingAdmin(FlutterDriver driver, int index) async {
  await tap(findByKey('switch_admin_$index'), driver);
  delay(time: 2);
  await tap(findByKey('flat_button_image_botton_modal_accept'), driver);
}
