import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'helpers.dart';
import 'utils/index.dart';

void main() {
  FlutterDriver driver;
  // driver.

  group('Login process - validate home elements', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Validate tab my group bk', () async {
      await loginProcess(driver);
      await tap(findByKey('tab-group-bk'), driver);
      await driver.waitFor(findByKey('tab-group-bk'));

      expect(await driver.getText(findByKey('tab-my-bk-title')), 'MY DATA');
      expect(await driver.getText(findByKey('tab-group-bk-title')), 'GROUP BK');
      expect(await driver.getText(findByKey('group-bk-title-cashbalance')),
          'CASH BALANCE');
      expect(
          await driver.getText(findByKey('group-bk-title-shares')), 'SHARES');
      expect(await driver.getText(findByKey('group-bk-title-creditsgranted')),
          'CREDITS GRANTED');
    });
  });
}
