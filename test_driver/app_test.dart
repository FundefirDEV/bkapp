import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  group('On boarding', () {
    final inputUsername = find.byValueKey('input-username');
    final inputPassword = find.byValueKey('input-password');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Write username', () async {
      await driver.tap(inputUsername);
      await driver.enterText('usernametest');
      await driver.waitFor(find.text('usernametest'));

      expect(find.text('passwordtest'), isNotNull);
    });

    test('Write password', () async {
      await driver.tap(inputPassword);
      await driver.enterText('passwordtest');
      await driver.waitFor(find.text('passwordtest'));
      expect(find.text('passwordtest'), isNotNull);
    });
  });
}
