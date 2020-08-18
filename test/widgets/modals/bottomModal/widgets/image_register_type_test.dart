import 'package:bkapp_flutter/src/screens/profileRegister/gender_screen.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/widgets/image_register_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test render widgets Image Register', () {
    testWidgets('Find ImageRegisterType Screen', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: ImageRegisterType(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find structure ImageRegisterType Screen',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: ImageRegisterType(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('row_register_modal')), findsOneWidget);
      // expect(find.byKey(Key('register_button1')), findsOneWidget);
      expect(find.byKey(Key('register_button2')), findsOneWidget);
    });

    testWidgets('Correct tab by pressing personalized register',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: ImageRegisterType(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('register_button2')), findsOneWidget);
      await tester.tap(find.byKey(Key('register_button2')));
      await tester.pumpAndSettle();
      expect(find.byType(GenderScreen), findsOneWidget);
    });

    // testWidgets('Correct tab by pressing google register',
    //     (WidgetTester tester) async {
    //   final testKey = Key('my-id');
    //   await tester
    //       .pumpWidget(baseTester(child: ImageRegisterType(key: testKey)));
    //   await tester.pumpAndSettle();

    //   expect(find.byKey(Key('register_button1')), findsOneWidget);
    //   await tester.tap(find.byKey(Key('register_button1')));
    //   await tester.pumpAndSettle();
    // });
  });
}
