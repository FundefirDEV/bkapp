import 'package:bkapp_flutter/src/screens/utils/utis_card_administrator_item.dart';
import 'package:bkapp_flutter/src/screens/utils/widgets/cardAdministratorUtils/card_administrator_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test CardAdministratorUtils Widget', () {
    List<UtilsCardsAdministratorItem> characters = [
      UtilsCardsAdministratorItem(
        key: 'exemptions',
        image: 'assets/images/admin_icon.svg',
        title: 'text 1',
        titleWeight: 'text 2',
        onPressed: () => {},
      ),
    ];
    testWidgets('Find CardAdministratorUtils widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: CardAdministratorUtils(
              key: testKey, adminCharacters: characters[0])));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure CardAdministratorUtils',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: CardAdministratorUtils(
              key: testKey, adminCharacters: characters[0])));
      await tester.pumpAndSettle();

      expect(
          find.byKey(Key('container-card-administrator-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('row-content-card-administrator-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('container-image-card-administrator-${characters[0].key}')),
          findsOneWidget);
      expect(find.byKey(Key('image-card-administrator-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('text-card-container-administrator-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(Key('title-text-card-administrator-${characters[0].key}')),
          findsOneWidget);
    });
  });
}
