import 'package:bkapp_flutter/src/routes/routesWithBloc/routes_with_bloc.dart';
import 'package:bkapp_flutter/src/screens/changePass/change_password_screen.dart';
import 'package:bkapp_flutter/src/screens/rulesEdit/rules_edit_screen.dart';
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
      case menuNavigator:
        return MaterialPageRoute(builder: (_) => MenuNavigatorScreen());
        break;
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => WillPopScope(
                child: loginRouteBloc(), onWillPop: () async => false));
        break;
      case introRoute:
        return MaterialPageRoute(builder: (_) => IntroRegisterScreen());
        break;
      case bankCreatedRoute:
        final BankCreatedScreenArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => BankCreatedScreen(data: data));
        break;
      case registerNameUser:
        final RegisterNameStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (_, __, ___) => RegisterNameStepScreen(data: data));
        break;
      case registerEmailUser:
        final RegisterEmailStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (_, __, ___) => RegisterEmailStepScreen(data: data));
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
      case registerpinCodeVerification:
        final RegisterPinCodeScreenStepArgs data = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => PinCodeStepScreen(data: data));
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
      case profileScreen:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) => ProfileScreen());
        break;
      case menuNavigator:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) => MenuNavigatorScreen());
      case buySharesScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BuySharesScreen(
                  oldIndex: 0,
                  tokenUser: null,
                  userName: null,
                ));
        break;
      case approvalsScreen:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) =>
                ApprovalsScreen(oldIndex: 1, tokenUser: null, userName: null));
        break;
      case creditStatusScreenRoute:
        return MaterialPageRoute(
            builder: (_) => StatusCreditRequestWidget(
                  userName: null,
                ));
        break;
      case rulesEditScreen:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) => RulesEditScreen());
        break;

        case changePasswordScreen:
        return PageRouteBuilder(
            transitionDuration: Duration(microseconds: 350),
            pageBuilder: (context, _, __) => ChangePassPage());
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
