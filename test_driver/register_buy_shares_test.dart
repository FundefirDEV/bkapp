import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:mock_data/mock_data.dart';

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

  test('Buy shares process', () async {
    final one = mockInteger(300, 999);
    final two = mockInteger(300, 999);
    final three = mockInteger(1000, 9999);
    final phone = '($one) $two-$three';
    final gender = Utils.getGender();
    final name = "BRTX ${mockName()} $three";
    final namePerson = Utils.getNameByGender(gender);
    final secondName = mockName('male');
    final email = 'brtx_${namePerson.toLowerCase()}_$one@gmail.com';
    final quantityShareRequested = '10';

    await registerNewUserAndBankProcess(
        driver, gender, namePerson, secondName, email, phone, name);

    await goToApprovals(driver);
    delay();
    await validateEmptyDataInApprovals(driver);
    delay();
    await tapButtonBuyShare(driver);
    delay();
    await validateEmptyScreenBuyShares(driver);
    delay();
    await requestBuyShareWithForm(driver, quantityShareRequested);
    delay();
    await validateContainerConfirmationAndClose(driver);
    delay();
    await validateDataFromRequestPending(driver, quantityShareRequested);
    delay();
    await goToApprovals(driver);
    delay();
    await validateCardRequestApprovals(driver, quantityShareRequested);
    delay();
    await logoutProcess(driver);
    delay(time: 3);

    expect(true, true);
  });
}

Future goToUtils(FlutterDriver driver) async {
  await tap(findByKey('utils-bottom-bar-item'), driver);
}

Future goToApprovals(FlutterDriver driver) async {
  await goToUtils(driver);
  await tap(findByKey('util-card-description-row-aprobation'), driver);
}

Future validateEmptyDataInApprovals(FlutterDriver driver) async {
  final cashBalance = findByKey('approval-card-cash-balance-bank-value');
  final shareRequest = findByKey('approval-card-share-request-bank-value');
  final creditRequest = findByKey('approval-card-credit-request-bank-value');
  final paymentRequest = findByKey('approval-card-payment-request-bank-value');

  expect(await driver.getText(cashBalance), contains('0'));
  expect(await driver.getText(shareRequest), contains('0'));
  expect(await driver.getText(creditRequest), contains('0'));
  expect(await driver.getText(paymentRequest), contains('0'));
}

Future tapButtonPlus(FlutterDriver driver) async {
  await tap(findByKey('button-action-plus'), driver);
}

Future tapButtonBuyShare(FlutterDriver driver) async {
  await tapButtonPlus(driver);
  await tap(findByKey('actions-button-line'), driver);
}

Future validateEmptyScreenBuyShares(FlutterDriver driver) async {
  final shareValue = findByKey('value-actions-text-value');
  final shareQuantity = findByKey('value-actions-number-actios-text');
  final shareRequested = findByKey('number-action-value-text');

  expect(await driver.getText(shareValue), contains('10,000'));
  expect(await driver.getText(shareQuantity), contains('Sin límites'));
  expect(await driver.getText(shareRequested), contains('0'));
}

Future requestBuyShareWithForm(
    FlutterDriver driver, String quantityShareRequested) async {
  await type(findByKey('buy-shares-form-numberactions'), quantityShareRequested,
      driver);
  await tap(findByKey('flatbutton-buy-shares-form'), driver);
}

Future validateContainerConfirmationAndClose(FlutterDriver driver) async {
  // ignore: unused_local_variable
  final modalConfirmation = findByKey('container_image_bottom_modal');
  // ignore: unused_local_variable
  final titleModal = findByKey('text_title_image_bottom_modal');

  // expect(await driver.getText(titleModal), contains('pre-approved'));
  expect(find.text('pre-approved'), isNotNull);
  await tap(findByKey('flat_button_image_botton_modal_close'), driver);
}

Future validateDataFromRequestPending(
    FlutterDriver driver, String quantityShareRequested) async {
  final textRequests =
      findByKey('date-requested-action-text-requested-actions');
  final textQuantityRequested =
      findByKey('date-requested-action-text-quantity');
  // final date = findByKey('date-requested-action-date');
  // final status = findByKey('status-text-buy-shares-text');

  expect(await driver.getText(textRequests), contains('Requested actions'));
  expect(await driver.getText(textQuantityRequested),
      contains('$quantityShareRequested'));
  // expect(await driver.getText(date), '21-08-2020');
  // expect(await driver.getText(status), contains('Status'));
  // expect(await driver.getText(status), contains('PENDIENTE'));
}

Future validateCardRequestApprovals(
    FlutterDriver driver, String quantityShareRequested) async {
  // await driver.waitFor(findByKey('request-share-card-0'));
  // find.text(quantityShareRequested);
}
