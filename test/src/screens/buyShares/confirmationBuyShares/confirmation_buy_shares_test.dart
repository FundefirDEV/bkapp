import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/confirmation_buy_shares.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test ConfirmationBuyShares  Widget', () {
    testWidgets('Render ConfirmationBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
          child: BlocProvider(
            create: (context) => MenuNavigatorBloc(controller: PageController()),
            child: ConfirmationBuyShares(key: testKey)
          )
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TitleBuyShareWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleBuyShareWidget(key: testKey, navigateBloc: MenuNavigatorBloc(controller: PageController()), oldIndex: 0,)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
        baseTester(
          child: CardInformationBkWidget(key: testKey, childBlueWidth: 100,)
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render SharesBuyText', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: SharesBuyText(key: testKey, textBuyShares: true)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('ConfirmationBuyShares render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: BlocProvider(
          create: (context) => MenuNavigatorBloc(controller: PageController()),
          child: ConfirmationBuyShares()
        )
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('material-confirmation-buy-share-screen')),
          findsOneWidget);
      expect(find.byKey(Key('appbar-confirmation-buy-share-screen')),
          findsOneWidget);
      expect(find.byKey(Key('column-confirmation-buy-share-screen')),
          findsOneWidget);
    });
  });
}
