import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  Widget titleWidget(Key key) {
    return BlocProvider(
      create: (context) => MenuNavigatorBloc(controller: PageController()),
      child:
          TitleHeaderWidget(key: key, title: 'Titulo', menuNavigatorBloc: null),
    );
  }

  group('Test TitleHeaderUtilsWidget Widget', () {
    testWidgets('Find TitleHeaderUtilsWidget widget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: titleWidget(testKey)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('Find widgets structure TitleHeaderUtilsWidget',
        (WidgetTester tester) async {
      final testKey = Key('my-id');
      await tester.pumpWidget(baseTester(child: titleWidget(testKey)));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('title-container')), findsOneWidget);
      expect(find.byKey(Key('row-title-container')), findsOneWidget);
      expect(
          find.byKey(Key('left-arrow-image-container-title')), findsOneWidget);
      expect(find.byKey(Key('image-left-arrow-title')), findsOneWidget);
      expect(find.byKey(Key('title-container-text')), findsOneWidget);
      expect(find.byKey(Key('title-text')), findsOneWidget);
    });
  });
}
