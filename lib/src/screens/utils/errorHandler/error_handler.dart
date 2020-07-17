import 'package:bkapp_flutter/generated/i18n.dart';

String errorHandler(context, string) {
  switch (string) {
    case 'Required - Validator Error':
      return I18n.of(context).errorRequired;
    case 'Bad credentials':
      return I18n.of(context).errorInvalidUser;
    case 'Email - Validator Error':
      return I18n.of(context).errorInvalidEmail;
    default:
      return string;
  }
}
