import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/date_requested_actions.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/status_text_buy_shares.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/card_buy_shares_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ConfirmationBuyShares extends StatefulWidget {
  ConfirmationBuyShares({Key key}) : super(key: key);

  @override
  _ConfirmationBuySharesState createState() => _ConfirmationBuySharesState();
}

class _ConfirmationBuySharesState extends State<ConfirmationBuyShares> {
  @override
  Widget build(BuildContext context) {
    return Material(
      key: Key('material-confirmation-buy-share-screen'),
      color: Theme.of(context).colorScheme.grayColor[50],
      child: SingleChildScrollView(
        key: Key('scroll-confirmation-buy-share-screen'),
        child: AppBarWidget(
          key: Key('appbar-confirmation-buy-share-screen'),
          container: Column(
            key: Key('column-confirmation-buy-share-screen'),
            children: <Widget>[
              TitleBuyShareWidget(),
              CardBuyShares(
                childBlue: StatusTextBuyShares(),
                childWhite: DateRequestedActions(),
              ),
              SharesBuyText(textBuyShares: false),
            ],
          ),
        ),
      ),
    );
  }
}
