import 'package:bkapp_flutter/src/screens/bankRegister/addParterns/widgets/widgets.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/addParterns/add_partners_register_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/widgets/widgets.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test partner screen', () {

    testWidgets('PartnerScreen exists', (WidgetTester tester) async {
      final testKey = Key('partner-screen-id');
      await tester.pumpWidget(
        baseTester(child: AddPartnersRegisterScreen(key: testKey))
      );
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find main structure', (WidgetTester tester) async {
      final containerKey = Key('container-bk-partner-screen');
      final columnKey = Key('column-bk-partner-screen');
      final expandedKey = Key('expanded-bk-partner-screen');

      await tester.pumpWidget(
        baseTester(child: AddPartnersRegisterScreen())
      );
      await tester.pumpAndSettle();

      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(expandedKey), findsOneWidget);
      expect(find.byType(TitleBkWidget), findsOneWidget);
      expect(find.byType(PartnersStructureWidget), findsOneWidget);
      expect(find.byType(FooterBkWidget), findsOneWidget);
    });

    testWidgets('finding texts', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(child: AddPartnersRegisterScreen())
      );
      await tester.pumpAndSettle();

      expect(find.text('Now add the partners'), findsOneWidget);
      expect(find.text('from your BKapp'), findsOneWidget);
    });

  });
}
