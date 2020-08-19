import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/date_requested_actions.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/status_text_buy_shares.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ConfirmationBuyShares extends StatefulWidget {
  ConfirmationBuyShares({Key key, @required this.userName}) : super(key: key);
  final String userName;
  @override
  _ConfirmationBuySharesState createState() => _ConfirmationBuySharesState();
}

class _ConfirmationBuySharesState extends State<ConfirmationBuyShares> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      key: Key('material-confirmation-buy-share-screen'),
      color: Theme.of(context).colorScheme.grayColor[50],
      child: AppBarWidget(
        key: Key('appbar-confirmation-buy-share-screen'),
        userName: widget.userName,
        container: Column(
          key: Key('column-confirmation-buy-share-screen'),
          children: <Widget>[
            TitleBuyShareWidget(
                oldIndex: 0, navigateBloc: context.bloc<MenuNavigatorBloc>()),
            CardInformationBkWidget(
              childBlue: StatusTextBuyShares(),
              childWhite: DateRequestedActions(),
            ),
            SharesBuyText(textBuyShares: false),
          ],
        ),
      ),
    );
  }
}
