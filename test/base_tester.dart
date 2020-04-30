import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Widget baseTester({Widget child}) {
  final i18n = I18n.delegate;
  return MaterialApp(
    localizationsDelegates: [
      i18n,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    home: child,
  );
}
