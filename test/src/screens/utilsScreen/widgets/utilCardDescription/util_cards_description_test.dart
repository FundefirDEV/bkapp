import 'package:bkapp_flutter/src/screens/utilsScreen/utils_cards_item.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test UtilCardDescription Widget', () {
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
    testWidgets('Find UtilCardDescription widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: UtilCardDescription(key: testKey, characters: characters[0])));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure UtilCardDescription',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: UtilCardDescription(key: testKey, characters: characters[0])));
      await tester.pumpAndSettle();

      expect(
          find.byKey(
              Key('util-card-description-container-${characters[0].key}')),
          findsOneWidget);
      expect(find.byKey(Key('util-card-description-row-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(Key('util-card-description-image-${characters[0].key}')),
          findsOneWidget);
      expect(
          find.byKey(
              Key('util-card-description-content-card-${characters[0].key}')),
          findsOneWidget);
    });
  });
}
