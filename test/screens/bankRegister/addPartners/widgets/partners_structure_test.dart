import 'package:bkapp_flutter/src/screens/bankRegister/addParterns/widgets/partners_structure.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/addParterns/widgets/widgets.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test partner structure', () {

    testWidgets('PartnersStructureWidget exists', (WidgetTester tester) async {
      final testKey = Key('partner-structure-id');
      await tester.pumpWidget(
        baseTester(
          child: PartnersStructureWidget(key: testKey)
        )
      );
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Finding main widgets', (WidgetTester tester) async {
      final alignKey = Key('Align-partner-structure');
      final columnKey = Key('column-partner-structure');
      final expandedKey = Key('expanded-partner-structure');
      final gridViewKey = Key('gridview-partner-structure');
      final paddingMinimum = Key('padding-minimum-allowed');
      await tester.pumpWidget(
        baseTester(
          child: PartnersStructureWidget()
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(alignKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(expandedKey), findsOneWidget);
      expect(find.byKey(gridViewKey), findsOneWidget);
      expect(find.byKey(paddingMinimum), findsOneWidget);
      expect(find.byType(ButtonLineRoundedWidget), findsOneWidget);
      expect(find.byType(PartnerCardWidget), findsWidgets);
    });

    testWidgets('Findind texts', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: PartnersStructureWidget()
        )
      );
      await tester.pumpAndSettle();

      expect(find.text('PARTNERS'), findsOneWidget);
      expect(
        find.byWidgetPredicate((Widget widget) =>
          widget is RichText &&
          widget.text.toPlainText() == "ADD PARTNER"),
        findsOneWidget
      );
      expect(
        find.byWidgetPredicate((Widget widget) =>
          widget is RichText &&
          widget.text.toPlainText() == "Minimum 8 partners"),
        findsOneWidget
      );
    });

    testWidgets('Open modal for adding partners', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: PartnersStructureWidget()
        )
      );
      await tester.pumpAndSettle();

      expect(find.byType(InviteModal), findsNothing);
      await tester.tap(find.byType(ButtonLineRoundedWidget));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(InviteModal), findsOneWidget);
    });

  });
}
