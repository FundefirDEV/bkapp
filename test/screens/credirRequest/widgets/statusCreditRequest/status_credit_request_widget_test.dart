import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/statusCreditRequest/widgets/statusTextCreditRequest/status_text_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/statusCreditRequest/widgets/textImageCreditStatus/text_image_credit_status_widget.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/statusCreditRequest/widgets/titleStausCredit/title_status_credit_widget.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  Widget approvalTester({key}) {
    return BlocProvider(
        create: (context) => MenuNavigatorBloc(controller: PageController()),
        child: StatusCreditRequestWidget(key: key));
  }

  group('Test StatusCreditRequestWidget  Widget', () {
    final testKey = Key('status-credit-key');
    testWidgets('Render StatusCreditRequestWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: approvalTester(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TitleStatusCreditWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: TitleStatusCreditWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render CardBuyShares', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: CardInformationBkWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render StatusTextCreditRequest', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: StatusTextCreditRequest(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Render TextImageCreditStatusWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(
          baseTester(child: TextImageCreditStatusWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });
    testWidgets('StatusCreditRequestWidget render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: approvalTester(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('status-credit_request-widget-column')),
          findsOneWidget);
      expect(find.byKey(Key('status-credit_request-widget-container-text')),
          findsOneWidget);
      expect(
          find.byKey(Key('status-credit_request-widget-text')), findsOneWidget);
    });
  });
}
