import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/widgets/modals/preApprovedRequest/pre_approved_credit_modal.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../base_tester.dart';

class NavigateMockBloc extends MockBloc implements MenuNavigatorBloc {}

void main() {
  MenuNavigatorBloc navigateMockBloc;

  setUp(() {
    navigateMockBloc = NavigateMockBloc();
  });

  tearDown(() {
    navigateMockBloc?.close();
  });

  group('Test pre approved credit modal', () {
    testWidgets('Find credit modal', (WidgetTester tester) async {
      final keyMainContainer = Key('Main_container_credit_modal');
      final keyInternalContainer = Key('Internal_container_credit_modal');
      final keyStack = Key('Stack_credit_modal');
      final keyColumn = Key('Column_credit_modal');
      final keyButton = Key('FlatButton_credit_modal');
      final keyText = Key('RichText_credit_modal');

      await tester.pumpWidget(baseTester(child: PreApprovedCreditModal(
        tokenUser: 'xxxx',
        navigateBloc: navigateMockBloc,
      )));
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
