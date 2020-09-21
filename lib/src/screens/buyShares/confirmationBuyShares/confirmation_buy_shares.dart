import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/date_requested_actions.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/status_text_buy_shares.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ConfirmationBuyShares extends StatelessWidget {
  ConfirmationBuyShares(
      {Key key, @required this.userName, @required this.approvals})
      : super(key: key);
  final String userName;
  final ApprovalsModel approvals;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      key: Key('material-confirmation-buy-share-screen'),
      color: Theme.of(context).colorScheme.grayColor[50],
      child: AppBarWidget(
        key: Key('appbar-confirmation-buy-share-screen'),
        userName: this.userName,
        container: Column(
          key: Key('column-confirmation-buy-share-screen'),
          children: <Widget>[
            TitleHeaderWidget(
                title: I18n.of(context).buySharesActions,
                oldIndex: 0,
                menuNavigatorBloc: context.bloc<MenuNavigatorBloc>()),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CardInformationBkWidget(
                childBlueWidth: 115,
                childBlue: StatusTextBuyShares(),
                childWhite: DateRequestedActions(data: this.approvals),
              ),
            ),
            SharesBuyText(textBuyShares: false),
          ],
        ),
      ),
    );
  }
}
