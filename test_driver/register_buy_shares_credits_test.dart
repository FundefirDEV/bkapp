import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:mock_data/mock_data.dart';

import 'helpers.dart';
import 'utils/index.dart';
import 'utils/operations/commons.dart';
import 'utils/operations/credit.dart';
import 'utils/operations/share.dart';

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

  test('Buy shares and credits process', () async {
    final one = mockInteger(300, 399);
    final two = mockInteger(300, 999);
    final three = mockInteger(1000, 9999);
    final phone = '($one) $two-$three';
    final gender = Utils.getGender();
    final name = "BRTX ${mockName()} $three";
    final namePerson = Utils.getNameByGender(gender);
    final secondName = mockName('male');
    final email = 'brtx_${namePerson.toLowerCase()}_$one@gmail.com';
    final quantityShareRequested = '10';
    final amountCreditRequested = '50000';
    final installmentCreditRequested = '3';

    await registerNewUserAndBankProcess(
        driver, gender, namePerson, secondName, email, phone, name);

    await createShareRequest(driver, quantityShareRequested);
    delay();
    await goToApprovals(driver);
    delay();

    await validateCardRequestApprovals(driver, quantityShareRequested);
    delay(time: 3);
    await appoveShareRequest(driver);
    delay();
    await createCreditRequest(
        driver, amountCreditRequested, installmentCreditRequested);
    await logoutProcess(driver);
    delay(time: 5);

    expect(true, true);
  }, timeout: Timeout(Duration(seconds: 70)));
}
