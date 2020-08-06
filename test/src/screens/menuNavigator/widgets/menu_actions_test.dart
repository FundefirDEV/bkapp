import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/widgets/menuAnimated/menu_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tester.dart';

void main() {

  Widget menuWidget(Key key) {
    return BlocProvider(
      create: (context) => MenuNavigatorBloc(
        controller: PageController()
      ),
      child: MenuActions(
        key: key,
        hasLoaded: false,
        controller: AnimationController(vsync: TestVSync()),
      ),
    );
  }
  testWidgets('Test MenuActions exists', (WidgetTester tester) async {
    final keyMenuAction = Key('key-menu-action');
    await tester
      .pumpWidget(baseTester(child: menuWidget(keyMenuAction)));
    await tester.pumpAndSettle();

    expect(find.byKey(keyMenuAction), findsOneWidget);
  });

  testWidgets('Test the correct structure', (WidgetTester tester) async {
    final keyMenuAction = Key('key-menu-action');
    await tester
      .pumpWidget(baseTester(child: menuWidget(keyMenuAction)));
    await tester.pumpAndSettle();

    expect(find.byType(IgnorePointer), findsNWidgets(3));
    expect(find.byType(AnimatedOpacity), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(12));
    expect(find.byType(Row), findsNWidgets(2));
  });
}
