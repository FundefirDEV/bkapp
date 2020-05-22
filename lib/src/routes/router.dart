import 'package:bkapp_flutter/src/screens/bankCreated/bank_created_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/name_bk_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/select_city_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/gender_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/register_name_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
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
        return MaterialPageRoute(builder: (_) => IntroRegisterScreen());
        break;
      case bankCreatedRoute:
        return MaterialPageRoute(builder: (_) => BankCreatedScreen());
        break;
      case registerNameUser:
        final RegisterNameStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) =>
                RegisterNameStepScreen(data: data));
        break;
      case registerEmailUser:
        final RegisterEmailStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) =>
                RegisterEmailStepScreen(data: data));
        break;
      case registerPhoneUser:
        final RegisterPhoneStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) =>
                RegisterPhoneStepScreen(data: data));
        break;
      case registerPasswordUser:
        final RegisterPasswordStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) =>
                RegisterPasswordStepScreen(data: data));
        break;
      case confirmInvitationBank:
        final ConfirmInvitationBankStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) =>
                ConfirmInvitationBankStepScreen(data: data));
        break;

      case genderRoute:
        return MaterialPageRoute(builder: (_) => GenderScreen());
      break;
      case selectAddressRoute:
        return MaterialPageRoute(builder: (_) => SelectCityScreen());
      break;
      case nameBkRoute:
        return MaterialPageRoute(builder: (_) => NameBkScreen());
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
