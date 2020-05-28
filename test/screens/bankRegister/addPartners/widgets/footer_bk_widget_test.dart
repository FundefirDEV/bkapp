import 'package:bkapp_flutter/src/screens/bankRegister/widgets/number_step_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/addParterns/widgets/footer_bk_widget.dart';

import '../../../../base_tester.dart';

void main() {
  group('Test footer bk widget', () {

    testWidgets('FooterBkWidget exists', (WidgetTester tester) async {
      final testKey = Key('footer-bk-id');
      await tester.pumpWidget(baseTester(
        child: FooterBkWidget(key: testKey,)
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Finding main structure', (WidgetTester tester) async {
      final containerKey = Key('footer-partner-bk-container');
      final columnKey = Key('column-footer-partnerbk');

      await tester.pumpWidget(baseTester(
        child: FooterBkWidget()
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byType(NumberStepBkWidget), findsOneWidget);
    });

    testWidgets('Test if prev button redirects correctly', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: FooterBkWidget()
      ));
      await tester.pumpAndSettle();

      final prevKey = Key('inkwell-prev-page-redirect');
      expect(find.byKey(prevKey), findsOneWidget);

      await tester.tap(find.byKey(prevKey));
      await tester.pumpAndSettle();
      expect(find.byType(SelectCityScreen), findsOneWidget);
    });

    testWidgets('Test if next button redirects correctly', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
        child: FooterBkWidget()
      ));
      await tester.pumpAndSettle();

      final nextKey = Key('inkwell-next-page-redirect');
      expect(find.byKey(nextKey), findsOneWidget);

      await tester.tap(find.byKey(nextKey));
      await tester.pumpAndSettle();
      expect(find.byType(NameBkScreen), findsOneWidget);
    });

  });
}
