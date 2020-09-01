import 'package:bkapp_flutter/generated/i18n.dart';

import 'constans_error.dart';

String errorHandler(context, string) {
  switch (string) {
    case requiredValue:
      return I18n.of(context).errorRequired;
      break;
    case incompletePhone:
      return I18n.of(context).errorGraterThanNine;
      break;
    case differentPasswords:
      return I18n.of(context).errorDifferentPasswords;
      break;
    case 'Email - Validator Error':
      return I18n.of(context).errorInvalidEmail;
      break;
    case 'Required - Validator Error':
      return I18n.of(context).errorRequired;
      break;
    case 'Bad credentials':
      return I18n.of(context).errorInvalidUser;
      break;
    default:
      return string;
  }
}
