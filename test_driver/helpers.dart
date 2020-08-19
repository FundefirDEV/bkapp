import 'package:flutter_driver/flutter_driver.dart';

SerializableFinder findByKey(String key) {
  return find.byValueKey(key);
}

Future<void> tap(SerializableFinder element, FlutterDriver driver) async {
  await driver.tap(element);
}

Future<void> type(
    SerializableFinder element, String text, FlutterDriver driver) async {
  await tap(element, driver);
  await driver.enterText(text);
  await driver.waitFor(find.text(text));
}
