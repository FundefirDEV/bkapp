import 'package:bkapp_flutter/src/widgets/modals/approveDiscardRequest/approve_credit_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../base_tester.dart';

void main() {
  group('Test approve or discard credit modal', () {
    testWidgets('Find credit modal', (WidgetTester tester) async {
      final keyMainContainer = Key('Main_container_approve_credit_modal');
      final keyInternalContainer = Key('Internal_container_approve_credit_modal');
      final keyStack = Key('Stack_approve_credit_modal');
      final keyColumn = Key('Column_approve_credit_modal');
      final keyButton = Key('FlatButton_approve_credit_modal');
      final keyText = Key('RichText_approve_credit_modal');

      await tester.pumpWidget(baseTester(child: ApproveCreditModal()));
      await tester.pumpAndSettle();

      expect(find.byKey(keyMainContainer), findsOneWidget);
      expect(find.byKey(keyInternalContainer), findsOneWidget);
      expect(find.byKey(keyStack), findsOneWidget);
      expect(find.byKey(keyColumn), findsOneWidget);
      expect(find.byKey(keyButton), findsOneWidget);
      expect(find.byKey(keyText), findsOneWidget);
    });
  });
}
