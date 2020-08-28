import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:bkapp_flutter/main.dart' as app;

void main() {
  enableFlutterDriverExtension();
  app.main(localeDefault: Locale("en", "US"));
}
