import 'package:bkapp_flutter/src/widgets/customTabIndicator/custom_tab_indicator_widget.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  test('Assert CustomPainter should return an assertion error', () {
      expect(() =>
        CustomPainter(null, () {}),
        throwsA(isA<AssertionError>())
      );
    });
}
