import 'package:flutter_driver/flutter_driver.dart';

import '../../helpers.dart';
import 'commons.dart';

Future createCreditRequest(FlutterDriver driver, String amountCreditRequested,
    String installmentCreditRequested) async {
  await tapButtonCredit(driver);
  await driver.scrollUntilVisible(findByKey('credit-form-container'),
      findByKey('selected-card-pay-advanced'),
      dyScroll: -100);
  await type(
      findByKey('credit-form-request-value'), amountCreditRequested, driver);

  await tap(findByKey('credit-form-request-value'), driver);
  await type(findByKey('buy-shares-form-numberactiosdsns'),
      installmentCreditRequested, driver);
  await tap(findByKey('selected-card-pay-installment'), driver);
  await tap(findByKey('raisedButton-accept-credit-reques'), driver);
}

Future tapButtonCredit(FlutterDriver driver) async {
  await tapButtonPlus(driver);
  await tap(findByKey('credit-button-line'), driver);
}
