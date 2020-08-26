import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/utils_cards_item.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/utis_card_administrator_item.dart';
import 'package:bkapp_flutter/src/screens/utilsScreen/widgets/widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';

class UtilsScreen extends StatefulWidget {
  UtilsScreen({Key key, this.userName}) : super(key: key);
  final String userName;
  @override
  _UtilsScreenState createState() => _UtilsScreenState();
}

class _UtilsScreenState extends State<UtilsScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.bloc<MenuNavigatorBloc>();
    final HomeRoutesConstant routes = HomeRoutesConstant();

    List<UtilsCardsItem> characters = [
      UtilsCardsItem(
          key: 'aprobation',
          image: 'assets/images/check.svg',
          aprobations: true,
          number: " ",
          title: I18n.of(context).utilsApprovals,
          titleWeight: I18n.of(context).utilsRequests,
          textDescription: I18n.of(context).utilsApproveCreditActions,
          onPressed: () =>
              navigateBloc.add(ButtonPressed(goTo: routes.aprobationScreen))),
      UtilsCardsItem(
        key: 'rules',
        image: 'assets/images/parchment.svg',
        aprobations: false,
        title: I18n.of(context).utilsRulesOf,
        titleWeight: I18n.of(context).utilsGroupBk,
        textDescription: I18n.of(context).utilsKnowManageBk,
        onPressed: () =>
            navigateBloc.add(ButtonPressed(goTo: routes.rulesScreen)),
      ),
      // UtilsCardsItem(
      //   key: 'payment',
      //   image: 'assets/images/profit.svg',
      //   aprobations: false,
      //   title: I18n.of(context).utilsPaymentOf,
      //   titleWeight: I18n.of(context).utilsProfits,
      //   textDescription: I18n.of(context).utilsKnowEarningsYear,
      // )
    ];
    List<UtilsCardsAdministratorItem> adminCharacters = [
      UtilsCardsAdministratorItem(
        key: 'exemptions',
        image: 'assets/images/admin_icon.svg',
        title: '',
        titleWeight: I18n.of(context).utilsExemptions,
      ),
      UtilsCardsAdministratorItem(
          key: 'assign-admin',
          image: 'assets/images/admin_icon.svg',
          title: I18n.of(context).utilsAssignment,
          titleWeight: I18n.of(context).utilsAdministrator,
          onPressed: () => navigateBloc
              .add(ButtonPressed(goTo: routes.administratorAssignmentScreen)))
    ];
    return Scaffold(
        body: AppBarWidget(
            userName: widget.userName,
            container: SafeArea(
              key: Key('safearea-util-screen'),
              child: Column(
                key: Key('column-util-screen'),
                children: <Widget>[
                  TitleHeaderWidget(
                    title: I18n.of(context).utilsUtils,
                    showArrow: false,
                  ),
                  for (var i = 0; i < characters.length; i++)
                    UtilCardDescription(characters: characters[i]),
                  Row(
                    key: Key('row-util-screen-cards'),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CardAdministratorUtils(
                          adminCharacters: adminCharacters[0]),
                      CardAdministratorUtils(
                          adminCharacters: adminCharacters[1]),
                    ],
                  ),
                ],
              ),
            )));
  }
}
