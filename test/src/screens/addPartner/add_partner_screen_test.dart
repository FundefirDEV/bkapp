import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/addPartner/add_partner_screen.dart';
import 'package:bkapp_flutter/src/screens/addPartner/content/top_container_add_partner_screen.dart';
import 'package:bkapp_flutter/src/screens/addPartner/content/widgets/bottom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  Widget addParnerTester({key}) {
    return BlocProvider(
        create: (context) => MenuNavigatorBloc(controller: PageController()),
        child: AddPartnerScreen(key: key, oldIndex: 0));
  }

  group('Add partner', () {
    testWidgets('Find add partner screen', (WidgetTester tester) async {
      final scaffolsKey = Key('scafforld_add_partner_screen');
      final mainColumnKey = Key('column_add_partner_screen');
      final titleKey = Key('title_header_top_partner_screen');

      await tester.pumpWidget(
          baseTester(child: addParnerTester(key: Key('add-partner-tester'))));
      await tester.pumpAndSettle();

      expect(find.byKey(scaffolsKey), findsOneWidget);
      expect(find.byKey(mainColumnKey), findsOneWidget);
      expect(find.byKey(titleKey), findsOneWidget);
    });
    testWidgets('Find top container ', (WidgetTester tester) async {
      final columnKey = Key('main_column_top_partner_screen');
      final topKey = Key('top_container_partner_screen');
      final bottomKey = Key('bottom_container_partner_screen');

      await tester
          .pumpWidget(baseTester(child: TopContainerAddPartnerScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(columnKey), findsOneWidget);
      expect(find.byKey(topKey), findsOneWidget);
      expect(find.byKey(bottomKey), findsOneWidget);
    });
    testWidgets('Find tabs add partner screen ', (WidgetTester tester) async {
      final activesKey = Key('tab-activos');
      final pendingKeys = Key('tab-pendientes');

      await tester
          .pumpWidget(baseTester(child: TopContainerAddPartnerScreen()));
      await tester.pumpAndSettle();

      expect(find.byKey(activesKey), findsOneWidget);
      expect(find.byKey(pendingKeys), findsOneWidget);
    });

    testWidgets('Find bottom text add patner screen ',
        (WidgetTester tester) async {
      final containerKey = Key('container-botom-text-add-partner-screen');
      final textKey = Key('botom-text-add-partner-screen');

      await tester.pumpWidget(baseTester(child: BottomText()));
      await tester.pumpAndSettle();

      expect(find.byKey(containerKey), findsOneWidget);
      expect(find.byKey(textKey), findsOneWidget);
    });
  });
}
