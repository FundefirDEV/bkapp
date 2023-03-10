import 'dart:io'
    show HttpClient, HttpOverrides, Platform, SecurityContext, X509Certificate;

import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/src/utils/tablet_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:bkapp_flutter/src/routes/router.dart' as Routes;
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:logger/logger.dart';

import 'core/bloc/app_bloc.dart';

import 'package:sentry/sentry.dart';

import 'core/services/api/http_requests.dart';

final SentryClient sentry = SentryClient(
    dsn: EnvironmentConfig.DSN_SENTRY,
    environmentAttributes: Event(environment: EnvironmentConfig.ENV));

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        print('Acepting bad certificate for $host');
        return true;
      };
  }
}

class SimpleBlocDelegate extends BlocObserver {
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

  // @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   logger.e(error);
  //   super.onError(cubit, error, stackTrace);
  // }
}

void main({Locale localeDefault}) async {
  try {
    HttpOverrides.global = new MyHttpOverrides();
    Bloc.observer = SimpleBlocDelegate();
    if (!kIsWeb) _setTargetPlatformForDesktop();
    runApp(MyApp(
      localeDefault: localeDefault,
    ));
  } catch (error, stackTrace) {
    await sendError(error, stackTrace);
  }
}

Future sendError(error, StackTrace stackTrace) async {
  if (EnvironmentConfig.ENV != "DEV") {
    await sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
  } else {
    print({
      "exception": error,
      "stackTrace": stackTrace,
    });
  }
}

void setOrientation(context) {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  if (TabletDetector.isTablet(data) == false) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({this.localeDefault});
  Locale localeDefault;


  @override
  Widget build(BuildContext context) {

    setOrientation(context);
    final i18n = I18n.delegate;
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bk App',
        navigatorKey: navigationKey,
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
        // localeResolutionCallback:
        //     i18n.resolution(fallback: new Locale("es", "ES")),
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          if (localeDefault != null) return localeDefault;
          for (final supportedLocale in supportedLocales) {
            if (locale.languageCode == supportedLocale.languageCode) {
              return supportedLocale;
            }
          }

          return supportedLocales.first;
        },
        onGenerateRoute: Routes.Router.generateRoute,
        initialRoute: loginRoute,
      ),
    );
  }
}

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}
