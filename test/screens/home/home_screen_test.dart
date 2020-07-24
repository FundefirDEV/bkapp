import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/addPartner/add_partner_screen.dart';
import 'package:bkapp_flutter/src/screens/home/home_screen.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/optionsBk/options_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/tab_information_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/tabInformationBk/widgets/detail_group_data_bk_widget.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/menu_navigator_screen.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../base_tester.dart';

void main() {
  group('Test home bk principal screen', () {
    final key = Key('home-key');
    Widget homeTester({key}) {
      return BlocProvider(
          create: (context) => MenuNavigatorBloc(controller: PageController()),
          child: HomeScreen(key: key));
    }

    testWidgets('Render home screen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: homeTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Change custom Appbar wigdet', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: homeTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byType(AppBarWidget), findsOneWidget);
    });

    testWidgets('Change tab information bk wigdet',
        (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: homeTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byType(TabInformationBkWidget), findsOneWidget);
    });

    testWidgets('Change click tab GROUP BK', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: homeTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byType(TabInformationBkWidget), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      await tester.tap(find.byKey(Key('tab-group-bk')));
      await tester.pumpAndSettle();
      expect(find.byType(DetailGroupDataBkWidget), findsOneWidget);
    });

    testWidgets('Render separator line wigdet', (WidgetTester tester) async {
      final lineSeparator = Key('line-separator');
      await tester.pumpWidget(baseTester(child: homeTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byKey(lineSeparator), findsOneWidget);
    });

    testWidgets('Change options bk wigdet', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: homeTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byType(OptionsBkWidget), findsOneWidget);
    });
    testWidgets('Click partners card', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(
          child: BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController(initialPage: 0)),
              child: MenuNavigatorScreen())));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('home-bottom-bar-item')), findsOneWidget);
      await tester.tap(find.byKey(Key('home-bottom-bar-item')));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(OptionsBkWidget), findsOneWidget);
      await tester.drag(find.byType(AppBarWidget), const Offset(0.0, -600.0));
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      expect(find.byKey(Key('inkwell-redirect-add-partner')), findsOneWidget);
      await tester.tap(find.byKey(Key('inkwell-redirect-add-partner')));
      await tester.pumpAndSettle(Duration(microseconds: 100));
      expect(find.byType(AddPartnerScreen), findsOneWidget);
    });
  });
}
