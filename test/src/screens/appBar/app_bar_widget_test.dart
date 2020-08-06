import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  group('Test Appbar widget', () {
    final key = Key('appbar-key');
    testWidgets('Render widget custom Appbar', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: AppBarWidget(
        key: key,
        container: Container(
          child: Text('Prueba'),
        ),
      )));
      await tester.pumpAndSettle();
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Find Svg render the icons', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: AppBarWidget(
        key: key,
        container: Container(
          child: Text('Prueba'),
        ),
      )));
      await tester.pumpAndSettle();
      expect(find.byType(SvgPicture), findsNWidgets(3));
    });

    testWidgets('Change icon Salito', (WidgetTester tester) async {
      final iconSalito = Key('icon-salito');
      await tester.pumpWidget(baseTester(
          child: AppBarWidget(
        key: key,
        container: Container(
          child: Text('Prueba'),
        ),
      )));
      await tester.pumpAndSettle();
      expect(find.byKey(iconSalito), findsOneWidget);
    });

    testWidgets('Change text name user', (WidgetTester tester) async {
      final textNameUser = Key('text-name');
      await tester.pumpWidget(baseTester(
          child: AppBarWidget(
        key: key,
        container: Container(
          child: Text('Prueba'),
        ),
      )));
      await tester.pumpAndSettle();
      expect(find.byKey(textNameUser), findsOneWidget);
    });

    testWidgets('Change button logout', (WidgetTester tester) async {
      final buttonLogout = Key('button-logout');
      await tester.pumpWidget(baseTester(
          child: AppBarWidget(
        key: key,
        container: Container(
          child: Text('Prueba'),
        ),
      )));
      await tester.pumpAndSettle();
      expect(find.byKey(buttonLogout), findsOneWidget);
    });
  });
}
