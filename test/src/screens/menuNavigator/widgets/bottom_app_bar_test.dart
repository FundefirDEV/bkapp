import 'package:bkapp_flutter/src/screens/menuNavigator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

widgetTester({ key }) {
  return baseTester(
    child: Scaffold(
      bottomNavigationBar: CustomBottomBar(
        key: key,
        notchedShape: CircularNotchedRectangle(),
        color: Colors.grey,
        selectedColor: Colors.blueAccent,
        items: [
          BottomBarItem(
            key: Key('home-bottom-bar-item'),
            iconData: 'assets/images/home.svg',
            text: 'text 1'
          ),
          BottomBarItem(
            key: Key('utils-bottom-bar-item'),
            iconData: 'assets/images/archive.svg',
            text: 'text 2'
          ),
          BottomBarItem(
            key: Key('profile-bottom-bar-item'),
            iconData: 'assets/images/user.svg',
            text: 'text 3'
          )
        ],
      ),
    ),
  );
}

void main() {
  testWidgets('Test CustomBottomBar exists', (WidgetTester tester) async {
    final keyCustomBar = Key('key-custom-bar');
    await tester.pumpWidget(widgetTester(key: keyCustomBar));
    await tester.pumpAndSettle();

    expect(find.byKey(keyCustomBar), findsOneWidget);
  });

  testWidgets('Test main structure', (WidgetTester tester) async {
    await tester.pumpWidget(widgetTester());
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('Test button items', (WidgetTester tester) async {
    await tester.pumpWidget(widgetTester());
    await tester.pumpAndSettle();

    expect(find.byType(InkWell), findsNWidgets(3));
    expect(find.byType(Column), findsNWidgets(3));
    expect(find.byType(SizedBox), findsNWidgets(12));
  });
}
