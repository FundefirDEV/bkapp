import 'package:bkapp_flutter/src/widgets/modals/preApprovedRequest/pre_approved_shares_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../base_tester.dart';

void main() {
  group('Test pre approved shares modal', () {
    testWidgets('Find shares modal', (WidgetTester tester) async {
      final keyMainContainer = Key('Main_container_shares_modal');
      final keyInternalContainer = Key('Internal_container_shares_modal');
      final keyStack = Key('Stack_shares_modal');
      final keyColumn = Key('Column_shares_modal');
      final keyButton = Key('FlatButton_shares_modal');
      final keyText = Key('RichText_shares_modal');

      await tester.pumpWidget(baseTester(child: PreApprovedSharesModal()));
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
