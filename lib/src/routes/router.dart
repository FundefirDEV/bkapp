import 'package:bkapp_flutter/src/screens/profileRegister/gender_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/register_user_steps_screen.dart';
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
          builder: (context) =>
            HomeTestScreen(title: I18n.of(context).testText));
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case introRoute:
        return MaterialPageRoute(
          builder: (_) => IntroRegisterScreen()
        );
        break;
      case registerNameStep:
        final RegisterUserStepsArgs data = settings.arguments;
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (context, _, __) => RegisterUserStepsScreen(data: data)
        );
        break;
      case genderRoute:
        return MaterialPageRoute(
          builder: (_) => GenderScreen()
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text(
                I18n.of(context).pageNotFound('${settings.name}'))),
          ));
    }
  }
}
