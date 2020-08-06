import 'package:bkapp_flutter/src/widgets/addPartners/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base_tester.dart';

void main() {

  Widget partnerTester({ key }) {
    return PartnerCardWidget(
      key: key,
      id: 1,
      name: 'Daniel Tavera',
      mobile: '21332324',
    );
  }
  group('Test partner card widget', () {

    testWidgets('PartnerCardWidget exists', (WidgetTester tester) async {
      final testKey = Key('partner-card-id');
      await tester.pumpWidget(
        baseTester(
          child: partnerTester(key: testKey)
        )
      );
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('PartnerCardWidget exists', (WidgetTester tester) async {
      final testKey = Key('partner-card-id');
      await tester.pumpWidget(
        baseTester(
          child: partnerTester(key: testKey)
        )
      );
      await tester.pumpAndSettle();
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find main structure widget', (WidgetTester tester) async {
      final fistStack = Key('first-stack-partner-card');
      final secondStack = Key('second-stack-partner-card');
      await tester.pumpWidget(
        baseTester(
          child: partnerTester()
        )
      );
      await tester.pumpAndSettle();

      expect(find.byKey(fistStack), findsOneWidget);
      expect(find.byKey(secondStack), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('Finding props into Text widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseTester(
          child: partnerTester()
        )
      );
      await tester.pumpAndSettle();

      expect(find.text('Daniel Tavera'), findsOneWidget);
      expect(find.text('21332324'), findsOneWidget);
    });
  });
}
