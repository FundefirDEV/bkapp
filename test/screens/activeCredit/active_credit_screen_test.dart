import 'dart:convert';

import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/active_credit_screen.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/detail_credit_widget.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/fee_next_card_widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  Widget activeCreditTester({key}) {
    return BlocProvider(
        create: (context) => MenuNavigatorBloc(controller: PageController()),
        child: ActiveCreditScreen(key: key, oldIndex: 0));
  }

  group('Test Active Credit screen', () {
    final key = Key('active-credit');
    testWidgets('Render Active Credit screen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: activeCreditTester(key: key)));
      await tester.pumpAndSettle();

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Render structure main', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: activeCreditTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byType(AppBarWidget), findsOneWidget);
      expect(find.byType(TitleHeaderWidget), findsOneWidget);
      expect(find.byType(CardInformationBkWidget), findsOneWidget);
      expect(find.byType(LineSeparatorWidget), findsOneWidget);
      expect(find.byType(DetailCreditWidget), findsOneWidget);
    });

    testWidgets('Find Carousel Widget', (WidgetTester tester) async {
      List paymentExample = jsonDecode(
          '[{"date":"20 / 08 /2020","feeValue":"115.000"},{"date":"20 / 09 /2020","feeValue":"115.000"},{"date":"20 / 10 /2020","feeValue":"115.000"}]');
      await tester.pumpWidget(baseTester(child: activeCreditTester(key: key)));
      await tester.pumpAndSettle();

      final testKey = Key('my-id');
      final viewportFraction = 0.8;
      final children = <Widget>[
        for (var i = 0; i < paymentExample.length; i++)
          FeeNextCardWidget(
            feeNumber: (i + 2).toString(),
            paymentDate: paymentExample[i]["date"],
            valueFee: paymentExample[i]["feeValue"],
          )
      ];
      await tester.pumpWidget(baseTester(
          child: Carousel(
        key: testKey,
        viewportFraction: viewportFraction,
        children: children,
      )));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
      expect(find.byType(FeeNextCardWidget), findsNWidgets(3));
    });

    testWidgets('Change title and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: activeCreditTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('subtitle-credit')), findsOneWidget);
      expect(find.byKey(Key('subtitle-fee-pending')), findsOneWidget);
    });

    testWidgets('Render button pay fee', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: activeCreditTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('raisedButton-pay-fee')), findsOneWidget);
    });
  });
}
