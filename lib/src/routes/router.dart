import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';

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
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => BankCreatedScreen());
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
          pageBuilder: (context, _, __) => AddPartnersRegisterScreen()
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
