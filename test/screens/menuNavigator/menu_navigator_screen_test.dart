import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/menu_navigator_screen.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/widgets/widgets.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
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

    testWidgets('Find custom bottom bar', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen()));
      await tester.pumpAndSettle();
      expect(find.byType(CustomBottomBar), findsOneWidget);
    });

    testWidgets('Find three barItems', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen()));
      await tester.pumpAndSettle();
      final customBottomBar = tester.widget<CustomBottomBar>(
        find.byType(CustomBottomBar)
      );
      expect(customBottomBar.items.length, equals(3));
    });

    testWidgets('Find option additional menu', (WidgetTester tester) async {
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
      await tester.tap(find.byKey(Key('utils-bottom-bar-item')));
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      expect(find.byType(UtilsScreen), findsOneWidget);
    });

    testWidgets('redirect jump to home', (WidgetTester tester) async {
      await tester
          .pumpWidget(baseTester(child: MenuNavigatorScreen(key: keyMenu)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('home-bottom-bar-item')), findsOneWidget);
      await tester.tap(find.byKey(Key('home-bottom-bar-item')));
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('redirect to profile', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => MenuNavigatorBloc(
              controller: PageController(initialPage: 0)
            ),
            child: MenuNavigatorScreen()
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(Key('profile-bottom-bar-item')), findsOneWidget);
      await tester.tap(find.byKey(Key('profile-bottom-bar-item')));
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.text('Empty Body 3'), findsOneWidget);
    });

    testWidgets('Open actions menu animated', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => MenuNavigatorBloc(
              controller: PageController(initialPage: 0)
            ),
            child: MenuNavigatorScreen()
          )
        )
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('option-additional')));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(MenuActions), findsOneWidget);

      await tester.tap(find.byKey(Key('option-additional')));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(MenuActions), findsOneWidget);
    });
  });
}