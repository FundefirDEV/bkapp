import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:mock_data/mock_data.dart';
import 'utils/operations/commons.dart';
import 'utils/operations/share.dart';

import 'helpers.dart';
import 'utils/index.dart';

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

  String _getGender() {
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

  String _getNameByGender(String gender) {
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

  List<dynamic> _makePartnerList(int partnersQuantity) {
    final List<dynamic> partners = [];
    for (int i = 0; i < partnersQuantity; i++) {
      final gender = _getGender();
      final namePartner = _getNameByGender(gender);
      final one = mockInteger(300, 999);
      final two = mockInteger(300, 999);
      final three = mockInteger(1000, 9999);
      partners.add({
        'phone': '($one) $two-$three',
        'email': 'brtx_${namePartner.toLowerCase()}_$one-$three@gmail.com',
        'name': namePartner
      });
    }
    return partners;
  }

  Future _appovePartnerShareRequest(FlutterDriver driver) async {
    await driver.waitFor(findByKey('inkwell-approve-modal-request-card-0'));
    await tap(findByKey('inkwell-approve-modal-request-card-0'), driver);
    delay(time: 2);
    await tap(findByKey('flat_button_image_botton_modal_accept'), driver);
    delay(time: 2);
  }

  test('Creation bank process', () async {
    final one = mockInteger(300, 999);
    final two = mockInteger(300, 999);
    final three = mockInteger(1000, 9999);
    final phone = '($one) $two-$three';
    final gender = _getGender();
    final name = "BRTX ${mockName()} $three";
    final namePerson = _getNameByGender(gender);
    final secondName = mockName('male');
    final email = 'brtx_${namePerson.toLowerCase()}_$one-$three-@gmail.com';
    final quantityShareRequested = '10';
    final List<dynamic> partners =
        _makePartnerList(2); // Num of partners, recomended 2

    await registerFlow(driver, gender, namePerson, secondName, email, phone);

    await _selectStateCity(driver);
    await tap(findByKey('inkwell-select-city-redirect'), driver);

    for (int i = 0; i < partners.length; i++) {
      await invitePartner(driver, partners[i]['name'], partners[i]['phone']);
    }
    delay(time: 1);

    await driver.waitFor(findByKey('inkwell-next-page-redirect'));
    await tap(findByKey('inkwell-next-page-redirect'), driver);

    await _setBankNameAndContinue(driver, name);
    delay(time: 1);
    await tap(findByKey('buttonNextStep'), driver);

    delay(time: 1);

    await loginProcess(driver, username: email, password: '123456');
    delay(time: 1);

    await createShareRequest(driver, quantityShareRequested);
    delay();
    await goToApprovals(driver);
    delay(time: 1);
    await validateCardRequestApprovals(driver, quantityShareRequested);
    delay(time: 2);
    await appoveShareRequest(driver);
    await logoutProcess(driver);
    delay(time: 1);

    for (int i = 0; i < partners.length; i++) {
      await registerPartnerRequestShares(driver, gender, partners[i]['email'],
          partners[i]['name'], partners[i]['phone'], quantityShareRequested);
    }

    await loginProcess(driver, username: email, password: '123456');
    delay(time: 1);

    for (int i = 0; i < partners.length; i++) {
      await goToApprovals(driver);
      delay(time: 1);
      await _appovePartnerShareRequest(driver);
    }
    expect(
        await driver
            .getText(findByKey('approval-card-cash-balance-bank-value')),
        contains('1.900.000'));
    await logoutProcess(driver);

    expect(true, true);
  }, timeout: Timeout(Duration(seconds: 300)));
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
  delay(time: 1);
  await validateCardRequestApprovals(driver, quantityShareRequested);
  delay(time: 2);
  await logoutProcess(driver);
}

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

Future _setBankNameAndContinue(FlutterDriver driver, String name) async {
  await driver.waitFor(findByKey('input-namebk'));
  await type(findByKey('input-namebk'), name, driver);
  await tap(findByKey('flatbutton-create-bk'), driver);
}

Future _selectStateCity(FlutterDriver driver) async {
  await driver.waitFor(findByKey('list-state'));
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
