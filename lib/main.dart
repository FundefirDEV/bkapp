import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:bkapp_flutter/src/routes/router.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    return MaterialApp(
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
      localeResolutionCallback: i18n.resolution(
        fallback: new Locale("es", "ES")
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: genderRoute
    );
  }
}
