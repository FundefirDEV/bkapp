import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/buySharesBloc/buy_shares_form_bloc.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/card_buy_shares_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/buy_shares_form_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/number_actions_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/shares_buy_text_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/cardBuyShares/widgets/value_actions_widget.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BuySharesScreen extends StatefulWidget {
  BuySharesScreen({Key key}) : super(key: key);

  @override
  _BuySharesScreenState createState() => _BuySharesScreenState();
}

class _BuySharesScreenState extends State<BuySharesScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      key: Key('material-buy-share-screen'),
      color: Theme.of(context).colorScheme.grayColor[50],
      child: SingleChildScrollView(
        key: Key('scroll-buy-share-screen'),
        child: AppBarWidget(
          key: Key('appbar-buy-share-screen'),
          container: BlocProvider(
            key: Key('bloc-provider-buy-share-screen'),
            create: (context) => context.bloc<AppBloc>().buySharesFormBloc,
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
                        Navigator.pushNamed(
                            context, confirmationBuySharesRoute);
                      },
                      onFailure: (context, state) {
                        print('Failure');
                      },
                      child: Column(
                        key: Key('column-buy-share-screen'),
                        children: <Widget>[
                          TitleBuyShareWidget(),
                          CardBuyShares(
                              childBlue: NumberActions(),
                              childWhite: ValueActions()),
                          SharesBuyText(textBuyShares: true),
                          BuySharesFormWidget()
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
