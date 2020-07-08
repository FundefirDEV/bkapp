import 'package:bkapp_flutter/core/bloc/buySharesBloc/buy_shares_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/buyShares/buy_shares_screen.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  Widget buySharesTester({ key }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuNavigatorBloc(
            controller: PageController()
          )
        ),
        BlocProvider(
          create: (context) => BuySharesFormBloc(),
        )
      ],
      child: BuySharesScreen(key: key, oldIndex: 0)
    );
  }
  group('Test BuySharesScreen  Widget', () {
    testWidgets('Render BuySharesScreen', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
        child: buySharesTester(key: testKey)
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TitleBuyShareWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleBuyShareWidget(key: testKey, oldIndex: 0, navigateBloc: MenuNavigatorBloc(controller: PageController()))));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(
        child: CardInformationBkWidget(key: testKey, childBlueWidth: 100,)
      ));
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

    testWidgets('BuySharesScreen render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: buySharesTester()
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('material-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('appbar-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('builder-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('container-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('bloc-listener-buy-share-screen')), findsOneWidget);
      expect(find.byKey(Key('column-buy-share-screen')), findsOneWidget);
    });
  });
}
