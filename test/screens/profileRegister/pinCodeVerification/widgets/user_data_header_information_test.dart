import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/gender_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test UserDataHeaderInformation  Widget', () {
    final testKey = Key('my-id');
    final tag = 'tag';
    final image = 'assets/images/check.svg';
    testWidgets('Render UserDataHeaderInformation',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: UserDataHeaderInformation(
        key: testKey,
        tag: tag,
        image: image,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render ButtonBackWidget widget in UserDataHeaderInformation',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: UserDataHeaderInformation(
        key: testKey,
        tag: tag,
        image: image,
      )));
      await tester.pumpAndSettle();

      expect(find.byType(GenderImage), findsOneWidget);
    });

    testWidgets('UserDataHeaderInformation render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: UserDataHeaderInformation(
        key: testKey,
        tag: tag,
        image: image,
      )));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('user-data-header-information-container')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-container-data')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-container-name')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-text-name')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-container-email')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-text-email')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-container-phone')),
          findsOneWidget);
      expect(find.byKey(Key('user-data-header-information-text-phone')),
          findsOneWidget);
    });
  });
}
