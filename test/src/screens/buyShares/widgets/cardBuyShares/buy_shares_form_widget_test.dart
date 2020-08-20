import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/buy_shares_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  group('Test BuySharesFormWidget  Widget', () {
    testWidgets('Render BuySharesFormWidget', (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester
          .pumpWidget(baseTester(child: BuySharesFormWidget(key: testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('BuySharesFormWidget render structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: BuySharesFormWidget()));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('buy-shares-form-column')), findsOneWidget);
      expect(find.byKey(Key('material-shares-form-container')), findsOneWidget);
      expect(find.byKey(Key('buy-shares-form-container')), findsOneWidget);
      expect(find.byKey(Key('buy-shares-form-numberactions')), findsOneWidget);
      expect(
          find.byKey(Key('buy-shares-form-button-container')), findsOneWidget);
      expect(find.byKey(Key('flatbutton-buy-shares-form')), findsOneWidget);
      expect(find.byKey(Key('padding-label-button-buy-shares-form')),
          findsOneWidget);
    });

    testWidgets('Click FlatButton buy shares', (WidgetTester tester) async {
      // ignore: close_sinks
      BuySharesFormBloc bloc = BuySharesFormBloc(repository: null);

      await tester.pumpWidget(baseTester(
          child: BuySharesFormWidget(
        token: 'xxxxxx',
        buySharesBloc: bloc,
      )));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('flatbutton-buy-shares-form')), findsOneWidget);
      await tester.tap(find.byKey(Key('flatbutton-buy-shares-form')));
      await tester.pumpAndSettle();
    });
  });
}
