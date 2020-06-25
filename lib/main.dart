import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:bkapp_flutter/src/routes/router.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:logger/logger.dart';

import 'core/bloc/app_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  var logger = Logger(
      printer: PrettyPrinter(
    colors: false,
    errorMethodCount: 1,
    printEmojis: true,
    printTime: true,
    lineLength: 80,
    methodCount: 0,
  ));

  @override
  void onEvent(Bloc bloc, Object event) {
    logger.i(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.v({
      'currentState': '${transition.currentState}',
      'event': '${transition.event}',
      'nextState': '${transition.nextState}'
    });
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
          title: 'Bk App',
          theme: ThemeData(
            fontFamily: 'Nunito',
          ),
          localizationsDelegates: [
            i18n,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          supportedLocales: i18n.supportedLocales,
          localeResolutionCallback:
              i18n.resolution(fallback: new Locale("es", "ES")),
          onGenerateRoute: Router.generateRoute,
          initialRoute: loginRoute),
    );
  }
}
