import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../../helpers.dart';
import 'commons.dart';

Future createShareRequest(
    FlutterDriver driver, String quantityShareRequested) async {
  await goToApprovals(driver);
  delay();
  await validateEmptyDataInApprovals(driver);
  delay();
  await tapButtonBuyShare(driver);
  delay();
  await validateEmptyScreenBuyShares(driver);
  delay();
  await requestBuyShareWithForm(driver, quantityShareRequested);
  delay(time: 2);
  await validateContainerConfirmationAndClose(driver);
  delay();
  await validateDataFromRequestPending(driver, quantityShareRequested);
  delay();
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

Future tapButtonBuyShare(FlutterDriver driver) async {
  await tapButtonPlus(driver);
  delay();
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

Future appoveShareRequest(FlutterDriver driver) async {
  await driver.waitFor(findByKey('inkwell-approve-modal-request-card-0'));
  await tap(findByKey('inkwell-approve-modal-request-card-0'), driver);
  delay(time: 2);
  await tap(findByKey('flat_button_image_botton_modal_accept'), driver);
  delay(time: 2);
  expect(
      await driver.getText(findByKey('approval-card-cash-balance-bank-value')),
      contains('100.000'));
}
