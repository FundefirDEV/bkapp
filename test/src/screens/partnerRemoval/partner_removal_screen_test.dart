import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  testWidgets('Render partner removal screen', (tester) async {
    await tester.pumpWidget(baseTester(
        child: BlocProvider(
            create: (context) =>
                MenuNavigatorBloc(controller: PageController(initialPage: 0)),
            child: PartnerRemovalScreen(
                key: Key('partner-removal-screen'),
                oldIndex: 0,
                userName: 'Javier Cantor'))));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('partner-removal-screen')), findsOneWidget);
    expect(find.byType(InfoMainCard), findsOneWidget);
    expect(find.byType(TitleHeaderWidget), findsOneWidget);
  });
}
