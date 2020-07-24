import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/activeCredit/widgets/index.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class ActiveCreditScreen extends StatelessWidget {
  final int oldIndex;

  ActiveCreditScreen({Key key, @required this.oldIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);
    return AppBarWidget(
        key: Key('active-credit-screen'),
        container: Column(
          children: <Widget>[
            TitleHeaderWidget(
              title: I18n.of(context).activeCreditCredits,
              oldIndex: oldIndex,
              navigateBloc: menuNavigatorBloc,
            ),
            _subtitle(context),
            CardInformationBkWidget(
                childBlueWidth: 120,
                childBlue: FeeNumberWidget(),
                childWhite: FeeDetailWidget()),
            _buttonPayFee(context),
            LineSeparatorWidget(),
            _subtitleFeePending(context),
            FeeCarrouselWidget(),
            DetailCreditWidget()
          ],
        ));
  }

  Container _subtitleFeePending(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
      child: Text(
        I18n.of(context).activeCreditPendingInstallment,
        key: Key('subtitle-fee-pending'),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
      ),
    );
  }

  Padding _buttonPayFee(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
      child: RaisedButton(
          key: Key('raisedButton-pay-fee'),
          onPressed: () => {},
          color: Theme.of(context).colorScheme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: RichText(
              key: Key(''),
              text: TextSpan(
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4),
                  children: [
                    TextSpan(text: '${I18n.of(context).activeCreditPay} '),
                    TextSpan(
                        text: I18n.of(context).activeCreditInstallments,
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ]))),
    );
  }

  Container _subtitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 3,
          bottom: SizeConfig.safeBlockVertical * 4),
      child: Text(
        I18n.of(context).activeCreditNormal,
        key: Key('subtitle-credit'),
        style: TextStyle(color: Colors.white, letterSpacing: 4),
      ),
    );
  }
}
