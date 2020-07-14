import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/utils/utils_cards_item.dart';
import 'package:bkapp_flutter/src/screens/utils/utis_card_administrator_item.dart';
import 'package:bkapp_flutter/src/screens/utils/widgets/widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';

class UtilsScreen extends StatefulWidget {
  UtilsScreen({Key key}) : super(key: key);

  @override
  _UtilsScreenState createState() => _UtilsScreenState();
}

class _UtilsScreenState extends State<UtilsScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.bloc<MenuNavigatorBloc>();

    List<UtilsCardsItem> characters = [
      UtilsCardsItem(
          key: 'aprobation',
          image: 'assets/images/check.svg',
          aprobations: true,
          number: "4 ",
          title: I18n.of(context).utilsApprovals,
          titleWeight: I18n.of(context).utilsRequests,
          textDescription: I18n.of(context).utilsApproveCreditActions,
          onPressed: () => navigateBloc.add(ButtonPressed(goTo: 5))),
      UtilsCardsItem(
        key: 'rules',
        image: 'assets/images/parchment.svg',
        aprobations: false,
        title: I18n.of(context).utilsRulesOf,
        titleWeight: I18n.of(context).utilsGroupBk,
        textDescription: I18n.of(context).utilsKnowManageBk,
        onPressed: () => navigateBloc.add(ButtonPressed(goTo: 8)),
      ),
      UtilsCardsItem(
        key: 'withdrawall',
        image: 'assets/images/close_avatar.svg',
        aprobations: false,
        title: I18n.of(context).utilsWithdrawalOf,
        titleWeight: I18n.of(context).utilsPartners,
        textDescription: I18n.of(context).utilsDeleteDeliverActions,
      ),
      UtilsCardsItem(
        key: 'payment',
        image: 'assets/images/profit.svg',
        aprobations: false,
        title: I18n.of(context).utilsPaymentOf,
        titleWeight: I18n.of(context).utilsProfits,
        textDescription: I18n.of(context).utilsKnowEarningsYear,
      )
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
      )
    ];
    return Scaffold(
        body: AppBarWidget(
            container: SafeArea(
      key: Key('safearea-util-screen'),
      child: Column(
        key: Key('column-util-screen'),
        children: <Widget>[
          TitleHeaderWidget(title: I18n.of(context).utilsUtils, showArrow: false,),
          for (var i = 0; i < characters.length; i++)
            UtilCardDescription(characters: characters[i]),
          Row(
            key: Key('row-util-screen-cards'),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardAdministratorUtils(adminCharacters: adminCharacters[0]),
              CardAdministratorUtils(adminCharacters: adminCharacters[1]),
            ],
          ),
        ],
      ),
    )));
  }
}
