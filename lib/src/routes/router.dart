import 'package:bkapp_flutter/core/bloc/loginFormBloc/login_form_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/screens/bankCreated/bank_created_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/nameBk/name_bk_screen.dart';
import 'package:bkapp_flutter/src/screens/bankRegister/selectCity/select_city_screen.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/menu_navigator_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/gender_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/register_name_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case testRoute:
        return MaterialPageRoute(
            builder: (context) =>
                HomeTestScreen(title: I18n.of(context).testText));
        break;
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      LoginFormBloc(repository: loginRepository),
                  child: Builder(builder: (context) => LoginScreen()),
                ));
        break;
      case introRoute:
        return MaterialPageRoute(builder: (_) => IntroRegisterScreen());
        break;
      case bankCreatedRoute:
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => BankCreatedScreen());
        break;
      case registerNameUser:
        final RegisterNameStepArgs data = settings.arguments;
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (_, __, ___) => RegisterNameStepScreen(data: data)
        );
        break;
      case registerEmailUser:
        final RegisterEmailStepArgs data = settings.arguments;
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (_, __, ___) => RegisterEmailStepScreen(data: data)
        );
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
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 550),
            pageBuilder: (context, _, __) => SelectCityScreen());
        break;
      case nameBkRoute:
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => NameBkScreen());
        break;
      case addPartnersRegisterRoute:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) => AddPartnersRegisterScreen());
      case utilsScreenRoute:
        return MaterialPageRoute(builder: (_) => UtilsScreen());
        break;
      case menuNavigator:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) => MenuNavigatorScreen());
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
