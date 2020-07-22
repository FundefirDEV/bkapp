import 'package:bkapp_flutter/src/widgets/modals/deletePartner/content/delete_partners_buttons.dart';
import 'package:bkapp_flutter/src/widgets/modals/deletePartner/content/delete_partners_text.dart';
import 'package:bkapp_flutter/src/widgets/modals/deletePartner/delete_partner_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../base_tester.dart';

void main() {
  group('Test delete partner bottom modal', () {
    testWidgets('Find delete partner modal', (WidgetTester tester) async {
      final keyMainContainer = Key('main_container_delete_partner_modal');
      final keyInternalContainer =
          Key('internal_container_delete_partner_modal');
      final keyStack = Key('stack_delete_partner_modal');

      await tester.pumpWidget(baseTester(child: DeletePartnerModal(onSave: null,)));
      await tester.pumpAndSettle();

      expect(find.byKey(keyMainContainer), findsOneWidget);
      expect(find.byKey(keyInternalContainer), findsOneWidget);
      expect(find.byKey(keyStack), findsOneWidget);
    });

    testWidgets('Find text delete partner modal', (WidgetTester tester) async {
      final keyColumn = Key('column_delete_partner_modal_text');
      final keyImage = Key('image_delete_partner_modal_text');
      final keyText = Key('richText_delete_partner_modal');

      await tester.pumpWidget(baseTester(child: DeletePartnersText()));
      await tester.pumpAndSettle();

      expect(find.byKey(keyColumn), findsOneWidget);
      expect(find.byKey(keyImage), findsOneWidget);
      expect(find.byKey(keyText), findsOneWidget);
    });
  });
  testWidgets('Find buttons delete partner modal', (WidgetTester tester) async {
    final keyContainer = Key('main_container_delete_partner_modal_button');
    final keyRow = Key('row_delete_partner_modal_button');
    final keyDelete = Key('delete_button_partner_modal_button');
    final keyClose = Key('clode_button_partner_modal_button');

    await tester.pumpWidget(baseTester(child: DeletePartnersModalButtons(onSave: null,)));
    await tester.pumpAndSettle();

    expect(find.byKey(keyContainer), findsOneWidget);
    expect(find.byKey(keyRow), findsOneWidget);
    expect(find.byKey(keyDelete), findsOneWidget);
    expect(find.byKey(keyClose), findsOneWidget);
  });
}
