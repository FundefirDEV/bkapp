import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:mock_data/mock_data.dart';
import 'utils/operations/commons.dart';
import 'utils/operations/credit.dart';
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

  Future validateCashBalance(FlutterDriver driver, String value) async {
    expect(
        await driver
            .getText(findByKey('approval-card-cash-balance-bank-value')),
        contains(value));
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

  Future _appovePartnerShareRequest(FlutterDriver driver) async {
    await driver.waitFor(findByKey('inkwell-approve-modal-request-card-0'));
    await tap(findByKey('inkwell-approve-modal-request-card-0'), driver);
    delay(time: 2);
    await tap(findByKey('flat_button_image_botton_modal_accept'), driver);
    delay(time: 2);
  }

  test('Register partner admin', () async {
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
    delay();

    await driver.waitFor(findByKey('inkwell-next-page-redirect'));
    await tap(findByKey('inkwell-next-page-redirect'), driver);

    await _setBankNameAndContinue(driver, name);
    delay();
    await tap(findByKey('buttonNextStep'), driver);

    delay();

    await loginProcess(driver, username: email, password: '123456');
    delay();

    await createShareRequest(driver, quantityShareRequested);
    delay();

    await logoutProcess(driver);
    delay();

    for (int i = 0; i < partners.length; i++) {
      await registerPartnerRequestShares(driver, gender, partners[i]['email'],
          partners[i]['name'], partners[i]['phone'], quantityShareRequested);
    }

    await loginProcess(driver, username: email, password: '123456');
    delay();
    await goToAssignAdmin(driver);
    delay();

    await assingAdmin(driver, 1);
    delay(time: 2);
    await logoutProcess(driver);

    await loginProcess(driver,
        username: partners[0]['email'], password: '123456');
    delay();

    await goToApprovals(driver);
    for (int i = 0; i < partners.length + 1; i++) {
      await _appovePartnerShareRequest(driver);
    }
    await validateCashBalance(driver, '300.000');
    delay(time: 2);
    await logoutProcess(driver);
    delay();

    await loginProcess(driver, username: email, password: '123456');
    await createCreditRequest(driver, '50000', '3');
    delay();
    await logoutProcess(driver);
    delay();

    for (int i = 0; i < partners.length; i++) {
      await loginProcess(driver,
          username: partners[i]['email'], password: '123456');
      await createCreditRequest(driver, '50000', '3');
      delay();
      await logoutProcess(driver);
    }
    await loginProcess(driver,
        username: partners[0]['email'], password: '123456');

    await goToApprovals(driver);

    for (int i = 0; i < partners.length + 1; i++) {
      await acceptCreditRequest(driver);
      delay(time: 2);
    }
    await validateCashBalance(driver, '150.000');
    await createPaymentRequest(driver);
    await goToApprovals(driver);

    delay(time: 3);
    // acceptCreditRequest(driver);
    // delay(time: 10);

    await logoutProcess(driver);

    expect(true, true);
  }, timeout: Timeout(Duration(seconds: 230)));
}

Future createPaymentRequest(FlutterDriver driver) async {
  await tapButtonCredit(driver);
  delay(time: 2);
  await tap(findByKey('raisedButton-pay-fee'), driver);
  delay(time: 2);

  await tap(findByKey('flat_button_image_botton_modal_close'), driver);
  delay(time: 5);
}
