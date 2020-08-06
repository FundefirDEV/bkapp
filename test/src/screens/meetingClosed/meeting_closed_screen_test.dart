import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/meeting_closed_screen.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/card_general_detail_meeting_widget.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/carousel_cards_detail_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tester.dart';

void main() {
  Widget meetingClosedTester({key}) {
    return BlocProvider(
        create: (context) => MenuNavigatorBloc(controller: PageController()),
        child: MeetingClosedScreen(key: key, oldIndex: 0));
  }

  group('Test meeting closed screen', () {
    final key = Key('meeting-closed-key');
    testWidgets('Render meeting closed screen', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: meetingClosedTester(key: key)));
      await tester.pump();
      expect(find.byKey(key), findsOneWidget);
    });
    testWidgets('Render structure main', (WidgetTester tester) async {
      await tester.pumpWidget(baseTester(child: meetingClosedTester(key: key)));
      await tester.pumpAndSettle();
      expect(find.byType(TitleHeaderWidget), findsOneWidget);
      expect(find.byType(CardGeneralDetailMeetingWidget), findsOneWidget);
      expect(find.byType(LineSeparatorWidget), findsOneWidget);
      expect(find.byType(CarouselCardsDetailWidget), findsOneWidget);
    });
  });
}
