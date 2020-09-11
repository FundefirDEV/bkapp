import 'package:flutter_driver/flutter_driver.dart';

import '../../helpers.dart';
import 'commons.dart';

Future createCreditRequest(FlutterDriver driver, String amountCreditRequested,
    String installmentCreditRequested) async {
  await tapButtonCredit(driver);
  await driver.scrollUntilVisible(findByKey('credit-form-container'),
      findByKey('raisedButton-accept-credit-request'),
      dyScroll: -60);

  await type(
      findByKey('credit-form-request-value'), amountCreditRequested, driver);
  delay(time: 1);

  await type(findByKey('buy-shares-form-numberactiosdsns'),
      installmentCreditRequested, driver);

  await tap(findByKey('select-type-of-payment'), driver);

  //await tap(findByKey('selected-card-pay-installment'), driver);

  //await tap(findByKey('selected-card-pay-advanced'), driver);

  //await driver.waitFor(findByKey('selected-card-pay-advanced'));

  await tap(findByKey('raisedButton-accept-credit-request'), driver);
  delay(time: 2);
  await tap(findByKey('FlatButton_credit_modal'), driver);
  delay();
}

Future acceptCreditRequest(FlutterDriver driver) async {
  await driver.waitFor(findByKey('inkwell-approve-modal-request-card-0'));
  await tap(findByKey('inkwell-approve-modal-request-card-0'), driver);
  delay(time: 2);
  await tap(findByKey('flat_button_image_botton_modal_accept'), driver);
  delay(time: 2);
}

Future tapButtonCredit(FlutterDriver driver) async {
  await tapButtonPlus(driver);
  await tap(findByKey('credit-button-line'), driver);
}
