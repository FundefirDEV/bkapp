import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/utils/utils_cards_item.dart';
import 'package:bkapp_flutter/src/screens/utils/utils_screen.dart';
import 'package:bkapp_flutter/src/screens/utils/utis_card_administrator_item.dart';
import 'package:bkapp_flutter/src/screens/utils/widgets/cardAdministratorUtils/card_administrator_utils.dart';
import 'package:bkapp_flutter/src/screens/utils/widgets/utilCardsDescription/util_cards_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test Util Screen', () {
    testWidgets('Find Util Screen', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => MenuNavigatorBloc(
              controller: PageController(initialPage: 0)
            ),
            child: UtilsScreen(key: testKey)
          )
        )
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find UtilCardDescription widget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      List<UtilsCardsItem> characters = [
        UtilsCardsItem(
          key: 'util-card-aprobation',
          image: 'assets/images/check.svg',
          aprobations: true,
          number: "4 ",
          title: 'Title',
          titleWeight: 'Title 2',
          textDescription: 'Description',
          onPressed: () => {},
        )
      ];
      await tester.pumpWidget(baseTester(
          child: UtilCardDescription(key: testKey, characters: characters[0])));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    testWidgets('Find CardAdministratorUtils widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      List<UtilsCardsAdministratorItem> characters = [
        UtilsCardsAdministratorItem(
          key: 'itemCarousel-known-bk',
          image: 'assets/images/admin_icon.svg',
          title: 'text 1',
          titleWeight: 'text 2',
          onPressed: () => {},
        ),
      ];
      await tester.pumpWidget(baseTester(
          child: CardAdministratorUtils(
              key: testKey, adminCharacters: characters[0])));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsNWidgets(1));
    });

    testWidgets('Find widgets structure util screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: BlocProvider(
            create: (context) => MenuNavigatorBloc(
              controller: PageController(initialPage: 0)
            ),
            child: UtilsScreen()
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(Key('safearea-util-screen')), findsOneWidget);
      expect(find.byKey(Key('column-util-screen')), findsOneWidget);
      expect(find.byKey(Key('row-util-screen-cards')), findsOneWidget);
    });
  });
}
