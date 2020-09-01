import 'constants.dart';

String requestCreditHandler(String string) {
  switch (string) {
    case investment:
      return 'investment';
      break;
    case education:
      return 'education';
      break;
    case recreation:
      return 'recreation';
      break;
    case advance:
      return 'advance';
      break;
    case installment:
      return 'installment';
      break;
    case advanceEng:
      return 'advance';
      break;
    case installmentEng:
      return 'installment';
      break;
    default:
      return 'nothing';
  }
}
