import 'package:bkapp_flutter/generated/i18n.dart';

import 'constans_error.dart';

String errorHandler(context, string) {
  switch (string) {
    case requiredValue:
      return I18n.of(context).errorRequired;
    case incompletePhone:
      return I18n.of(context).errorGraterThanNine;
    case differentPasswords:
      return I18n.of(context).errorDifferentPasswords;
    case 'Email - Validator Error':
      return I18n.of(context).errorInvalidEmail;
    case 'Required - Validator Error':
      return I18n.of(context).errorRequired;
    case 'Bad credentials':
      return I18n.of(context).errorInvalidUser;
    default:
      return string;
  }
}
