import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';

import 'package:bkapp_flutter/src/screens/homeTest/home_test_screen.dart';
import 'package:bkapp_flutter/src/screens/login/login_screen.dart';
import 'package:bkapp_flutter/src/screens/introRegister/intro_register_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case testRoute:
        return MaterialPageRoute(
          builder: (context) => HomeTestScreen(
            title: I18n.of(context).testText
          )
        );
        break;
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen()
        );
        break;
      case introRoute:
        return MaterialPageRoute(
          builder: (_) => IntroRegisterScreen()
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text(
                I18n.of(context).pageNotFound('${settings.name}')
              )
            ),
          )
        );
    }
  }
}
