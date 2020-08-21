import 'package:bkapp_flutter/core/bloc/buySharesBloc/bloc/buy_shares_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/date_requested_actions.dart';
import 'package:bkapp_flutter/src/screens/buyShares/confirmationBuyShares/widgets/status_text_buy_shares.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ConfirmationBuyShares extends StatefulWidget {
  ConfirmationBuyShares(
      {Key key, @required this.userName, @required this.tokenUser})
      : super(key: key);
  final String userName;
  final String tokenUser;
  @override
  _ConfirmationBuySharesState createState() => _ConfirmationBuySharesState();
}

class _ConfirmationBuySharesState extends State<ConfirmationBuyShares>
    with AfterLayoutMixin<ConfirmationBuyShares> {
  @override
  void afterFirstLayout(BuildContext context) {
    context
        .bloc<BuySharesBloc>()
        .add(BuySharesInitialize(token: widget.tokenUser));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<BuySharesBloc, BuySharesState>(
      builder: (context, state) {
        if (state is BuySharesLoaded) {
          return Material(
            key: Key('material-confirmation-buy-share-screen'),
            color: Theme.of(context).colorScheme.grayColor[50],
            child: AppBarWidget(
              key: Key('appbar-confirmation-buy-share-screen'),
              userName: widget.userName,
              container: Column(
                key: Key('column-confirmation-buy-share-screen'),
                children: <Widget>[
                  TitleHeaderWidget(
                      title: I18n.of(context).buySharesActions,
                      navigateBloc: context.bloc<MenuNavigatorBloc>(),
                      oldIndex: 0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CardInformationBkWidget(
                      childBlueWidth: 130,
                      childBlue: StatusTextBuyShares(),
                      childWhite: DateRequestedActions(
                          data: state.infoShares.approvals),
                    ),
                  ),
                  SharesBuyText(textBuyShares: false),
                ],
              ),
            ),
          );
        }
        if (state is BuySharesFailure) {
          return Text('Se ha presentado un error, intenta nuevamente');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
