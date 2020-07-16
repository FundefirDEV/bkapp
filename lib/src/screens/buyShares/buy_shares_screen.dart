import 'package:bkapp_flutter/core/bloc/buySharesBloc/buy_shares_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'widgets/cardBuyShares/buy_shares_form_widget.dart';
import 'widgets/cardBuyShares/number_actions_widget.dart';
import 'widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'widgets/cardBuyShares/value_actions_widget.dart';

class BuySharesScreen extends StatefulWidget {
  BuySharesScreen({Key key, @required this.oldIndex}) : super(key: key);

  final int oldIndex;

  @override
  _BuySharesScreenState createState() => _BuySharesScreenState();
}

class _BuySharesScreenState extends State<BuySharesScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);
    return Material(
      key: Key('material-buy-share-screen'),
      color: Theme.of(context).colorScheme.grayColor[50],
      child: AppBarWidget(
          key: Key('appbar-buy-share-screen'),
          container: Container(
            child: Builder(
                key: Key('builder-buy-share-screen'),
                builder: (context) {
                  return Container(
                    key: Key('container-buy-share-screen'),
                    child: FormBlocListener<BuySharesFormBloc, String, String>(
                      key: Key('bloc-listener-buy-share-screen'),
                      onSubmitting: (context, state) {
                        print('Loading');
                      },
                      onSuccess: (context, state) {
                        context
                            .bloc<MenuNavigatorBloc>()
                            .add(ButtonPressed(goTo: 7));
                      },
                      onFailure: (context, state) {
                        print('Failure');
                      },
                      child: Column(
                        key: Key('column-buy-share-screen'),
                        children: <Widget>[
                          TitleBuyShareWidget(
                            oldIndex: widget.oldIndex,
                            navigateBloc: menuNavigatorBloc,
                          ),
                          CardInformationBkWidget(
                              childBlue: NumberActions(),
                              childWhite: ValueActions()),
                          SharesBuyText(textBuyShares: true),
                          BuySharesFormWidget()
                        ],
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
