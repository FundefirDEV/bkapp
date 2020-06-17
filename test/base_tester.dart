import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';

Widget baseTester({
  Widget child,
  routes
}) {
  final i18n = I18n.delegate;
  return BlocProvider(
    create: (context) => AppBloc(),
    child: MaterialApp(
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: child,
      onGenerateRoute: Router.generateRoute,
    ),
  );
}
