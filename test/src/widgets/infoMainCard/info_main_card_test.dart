import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/widgets/infoMainCard/info_main_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  testWidgets('Testing info main card exists', (tester) async {
    await tester.pumpWidget(baseTester(
        child: BlocProvider(
            create: (context) =>
                MenuNavigatorBloc(controller: PageController(initialPage: 0)),
            child: InfoMainCard(
              key: Key('info-main-card-widget'),
              bottomValue: r'$0',
              titleBlue: 'GANANCIAS',
              topValue: r'$0',
              valueBlue: r'$1.000.000',
            ))));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('info-main-card-widget')), findsOneWidget);
  });

  testWidgets('Testing main structure', (tester) async {
    await tester.pumpWidget(baseTester(
        child: BlocProvider(
            create: (context) =>
                MenuNavigatorBloc(controller: PageController(initialPage: 0)),
            child: InfoMainCard(
              key: Key('info-main-card-widget'),
              bottomValue: r'$0',
              titleBlue: 'GANANCIAS',
              topValue: r'$0',
              valueBlue: r'$1.000.000',
            ))));
    await tester.pumpAndSettle();

    expect(find.byType(Column), findsNWidgets(4));
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(6));
  });
}
