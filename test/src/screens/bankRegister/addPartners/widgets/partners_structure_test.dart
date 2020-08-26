import 'package:bkapp_flutter/core/services/sql/sqflite.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/contacts/contact_list.dart';
import 'package:bkapp_flutter/src/widgets/modals/inviteModal/invite_modal.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {
  PartnerDatabaseProvider pendingPartnersDb = PartnerDatabaseProvider.db;

  Widget partnerTester({ key }) {
    return PartnersStructureWidget(
      key: key,
      onSave: () {},
      partnerDb: pendingPartnersDb
    );
  }

  group('Test partner structure', () {
    testWidgets('PartnersStructureWidget exists', (WidgetTester tester) async {
      final testKey = Key('partner-structure-id');
      await tester.pumpWidget(baseTester(child: partnerTester(key: testKey)));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Finding main widgets', (WidgetTester tester) async {
      final alignKey = Key('Align-partner-structure');
      final columnKey = Key('column-partner-structure');
      final expandedKey = Key('expanded-partner-structure');
      final paddingMinimum = Key('padding-minimum-allowed');
      await tester.pumpWidget(baseTester(child: partnerTester()));
      await tester.pumpAndSettle();

      expect(find.byKey(alignKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(expandedKey), findsOneWidget);
      expect(find.byKey(paddingMinimum), findsOneWidget);
      expect(find.byType(ButtonLineRoundedWidget), findsOneWidget);
    });

    testWidgets('Findind texts', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: partnerTester()));
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
      await tester.pumpWidget(baseTester(child: partnerTester()));
      await tester.pumpAndSettle();

      expect(find.byType(InviteModal), findsNothing);
      await tester.tap(find.byType(ButtonLineRoundedWidget));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(InviteModal), findsOneWidget);
    });

    testWidgets('Load partners', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: partnerTester()));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ButtonLineRoundedWidget));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byKey(Key('flat_button_load_partners')), findsOneWidget);

      await tester.tap(find.byKey(Key('flat_button_load_partners')));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.byType(ContactList), findsOneWidget);
      expect(find.byKey(Key('list_view_builder_contacts')), findsOneWidget);
    });

  });
}
