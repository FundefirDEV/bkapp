import 'package:bkapp_flutter/generated/i18n.dart';

import 'constanst.dart';

String errorRequestHandler(context, String string) {
  switch (string) {
    case userNotAvailable:
      return I18n.of(context).requestErrorUserNotAvailable;
      break;
    default:
      return I18n.of(context).requestErrorDefault;
  }
}
