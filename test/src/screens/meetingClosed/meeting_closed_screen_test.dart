import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/meeting_repository.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/meeting_closed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../base_tester.dart';

class MeetingRepoMock extends Mock implements MeetingRepository {}

void main() {
  MeetingRepository meetingRepository = MeetingRepoMock();
  Widget baseWidgetTest({Key customKey}) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  MenuNavigatorBloc(controller: PageController())),
          BlocProvider(
            create: (context) => MeetingBloc(repository: meetingRepository),
          )
        ],
        child: MeetingClosedScreen(
          key: customKey,
          tokenUser: 'xxx',
          oldIndex: 0,
          userName: 'Usuario',
        ));
  }

  group('Test meeting closed screen', () {
    final key = Key('meeting-id');
    testWidgets('Render Meeting screen', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester
            .pumpWidget(baseTester(child: baseWidgetTest(customKey: key)));
        await tester.pump();
        expect(find.byKey(key), findsOneWidget);
      });
    });

    testWidgets('Render CircularProgressIndicator main',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester
            .pumpWidget(baseTester(child: baseWidgetTest(customKey: key)));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });
  });
}
