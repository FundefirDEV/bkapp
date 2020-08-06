import 'package:bkapp_flutter/src/screens/utilsScreen/utils_cards_item.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/widgets/utilCardsDescription/widgets/text_util_content_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../base_tester.dart';

void main() {
  group('Test TextUtilContentCard Widget', () {
    List<UtilsCardsItem> characters = [
      UtilsCardsItem(
        key: 'aprobation',
        image: 'assets/images/check.svg',
        aprobations: true,
        number: "4 ",
        title: 'Title',
        titleWeight: 'Title 2',
        textDescription: 'Description',
        onPressed: () => {},
      )
    ];
    testWidgets('Find TextUtilContentCard widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: TextUtilContentCard(key: testKey, characters: characters[0])));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure TextUtilContentCard',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: TextUtilContentCard(key: testKey, characters: characters[0])));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('row-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(Key('expanded-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('container-text-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(find.byKey(Key('text-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(Key(
              'division-container-text-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(Key(
              'expanded-text-description-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(Key(
              'container-text-description-content-card-utils-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('text-description-content-card-utils-${characters[0].key}')),
          findsOneWidget);
    });
  });
}
