import 'package:flutter_driver/flutter_driver.dart';

import '../../helpers.dart';

Future goToUtils(FlutterDriver driver) async {
  await tap(findByKey('utils-bottom-bar-item'), driver);
}

Future goToApprovals(FlutterDriver driver) async {
  await goToUtils(driver);
  await tap(findByKey('util-card-description-row-aprobation'), driver);
}

Future tapButtonPlus(FlutterDriver driver) async {
  await tap(findByKey('button-action-plus'), driver);
}
