import 'package:bkapp_flutter/src/screens/approvals/approvals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../base_tester.dart';

void main() {
  group('Test approvals_screen', () {
    testWidgets('Find approvalsScreen ', (WidgetTester tester) async {
      final scaffoldKey = Key('Scaffold-approvals-screen');
      final safeAreaKey = Key('SafeArea-approvals-screen');
      final mainColumnKey = Key('Main-column-approvals-screen');

      await tester.pumpWidget(baseTester(child: ApprovalsScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(scaffoldKey), findsOneWidget);
      expect(find.byKey(safeAreaKey), findsOneWidget);
      expect(find.byKey(mainColumnKey), findsOneWidget);
    });
    testWidgets('Find scroolable approvalsScreen', (WidgetTester tester) async {
      final expandedKey = Key('Expanded-scroolable-approvals-screen');
      final mainContainerKey =
          Key('Main-container-scroolable-approvals-screen');
      final scroolableKey = Key('Scroolable-approvals-screen');
      final sharesKey = Key('Container-scroolable-shares-approvals-screen');
      final creditKey = Key('Container-scroolable-credits-approvals-screen');
      final paymentKey = Key('Container-scroolable-payment-approvals-screen');

      await tester.pumpWidget(baseTester(child: ApprovalsScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(expandedKey), findsOneWidget);
      expect(find.byKey(mainContainerKey), findsOneWidget);
      expect(find.byKey(scroolableKey), findsOneWidget);
      expect(find.byKey(sharesKey), findsOneWidget);
      expect(find.byKey(creditKey), findsOneWidget);
      expect(find.byKey(paymentKey), findsOneWidget);
    });
    testWidgets('Find appbar approvalsScreen', (WidgetTester tester) async {
      final appbarKey = Key('Appbar-approvals-screen');
      final containerKey = Key('Container-appbar-approvals-screen');
      final columnKey = Key('Column-appbar-approvals-screen');
      final containerTitleKey = Key('Container-title-approvals-screen');
      final rowTitleKey = Key('Row-title-approvals');
      final leftArrowTitleKey = Key('Left-arrow-title-approvals-screen');
      final imageLeftArrowTitleKey =
          Key('image-left-arrow-title-apporvals_screen');
      final containerTitleTextKey = Key('Title-approvals-container-text');
      final textTitleKey = Key('Title-approvals-text');
      final columnPetitionsKey = Key('Column-petitions');
      final approvedPetitionsKey = Key('Approved-petitions-image');
      final numberPetitionsKey = Key('Number-petitions-value-text');
      final petitionTextKey = Key('petitions-text');
      final approvalsPaddingKey = Key('Value-approvals-padding');
      final approvalsTextsKey = Key('Accepted-approvals-column-container');
      final aceptedApprovalsKey = Key('Value-acepted-approvals-value-text');
      final aceptedApprovalsValueKey = Key('Accepted-approvals-text-value');
      final rejectedApprovalsColumnKey =
          Key('Rejected-approvals-column-container');
      final valueRejectedApprovalKey = Key('Value-rejected-approvals');
      final textValueRejectedApprovalsKey =
          Key('Value-rejected-approvals-text');

      await tester.pumpWidget(baseTester(child: ApprovalsScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(appbarKey), findsOneWidget);
      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(containerTitleKey), findsOneWidget);
      expect(find.byKey(rowTitleKey), findsOneWidget);
      expect(find.byKey(leftArrowTitleKey), findsOneWidget);
      expect(find.byKey(imageLeftArrowTitleKey), findsOneWidget);
      expect(find.byKey(containerTitleTextKey), findsOneWidget);
      expect(find.byKey(textTitleKey), findsOneWidget);
      expect(find.byKey(columnPetitionsKey), findsOneWidget);
      expect(find.byKey(approvedPetitionsKey), findsOneWidget);
      expect(find.byKey(numberPetitionsKey), findsOneWidget);
      expect(find.byKey(petitionTextKey), findsOneWidget);
      expect(find.byKey(approvalsPaddingKey), findsOneWidget);
      expect(find.byKey(approvalsTextsKey), findsOneWidget);
      expect(find.byKey(aceptedApprovalsKey), findsOneWidget);
      expect(find.byKey(aceptedApprovalsValueKey), findsOneWidget);
      expect(find.byKey(rejectedApprovalsColumnKey), findsOneWidget);
      expect(find.byKey(valueRejectedApprovalKey), findsOneWidget);
      expect(find.byKey(textValueRejectedApprovalsKey), findsOneWidget);
    });
  });
}
