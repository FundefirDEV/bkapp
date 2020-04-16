import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/homeTest/home_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: i18n.supportedLocales,
      localeResolutionCallback: i18n.resolution(fallback: new Locale("es", "ES")),
      home: HomeTestScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
