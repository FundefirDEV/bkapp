import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/menu_navigator_screen.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test menu navigator screen', () {
    final keyMenu = Key('menu-key');
    testWidgets('Render Menu navigator', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();
      expect(find.byKey(keyMenu), findsOneWidget);
    });

    testWidgets('Change three options the menu', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();
      expect(find.byType(IconButton), findsNWidgets(3));
    });

    testWidgets('Change menu options', (WidgetTester tester) async {
      final optionHome = Key('option-home');
      final optionUtils = Key('option-utils');
      final optionProfile = Key('option-profile');
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();
      expect(find.byKey(optionHome), findsOneWidget);
      expect(find.byKey(optionUtils), findsOneWidget);
      expect(find.byKey(optionProfile), findsOneWidget);
    });

    testWidgets('Change option additional menu', (WidgetTester tester) async {
      final optionAdditional = Key('option-additional');
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byKey(optionAdditional), findsOneWidget);
    });

    testWidgets('Render home widget as first screen the menu navigator',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Change click option menu Utils', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('option-utils')));
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      expect(find.byType(UtilsScreen), findsOneWidget);
    });

    testWidgets('redirect jump 0', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('option-home')), findsOneWidget);
      await tester.tap(find.byKey(Key('option-home')));
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('redirect jump 1', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('option-utils')), findsOneWidget);
      await tester.tap(find.byKey(Key('option-utils')));
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(UtilsScreen), findsOneWidget);
    });
  });
}
