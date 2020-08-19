import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:bkapp_flutter/src/widgets/modals/preApprovedRequest/pre_approved_credit_modal.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'widgets/widgets.dart';

class CreditScreen extends StatelessWidget {
  CreditScreen({Key key, @required this.oldIndex, this.userName})
      : super(key: key);

  final int oldIndex;
  final String userName;
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CreditFormBloc creditFormBloc = context.bloc<AppBloc>().creditFormBloc;
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);

    return AppBarWidget(
        userName: this.userName,
        container: Column(
          children: <Widget>[
            TitleHeaderWidget(
              title: 'Créditos',
              oldIndex: oldIndex,
              navigateBloc: menuNavigatorBloc,
            ),
            TabCreditTypeWidget(),
            LineSeparatorWidget(),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 2),
              child: Text(I18n.of(context).creditScreenCreditRequest,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 5,
                      color: Theme.of(context).colorScheme.grayColor[300],
                      fontWeight: FontWeight.w100)),
            ),
            FormFields(),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 3),
              child: Text(I18n.of(context).creditScreenWayToPay,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                      color: Theme.of(context).colorScheme.grayColor[300],
                      fontWeight: FontWeight.w100)),
            ),
            SelectedPayInstallmentsWidget(
              onTabSelected: (item) =>
                  creditFormBloc.paymentMethods.updateValue(item),
              items: [
                CardSelected(
                  key: Key('selected-card-pay'),
                  text: I18n.of(context).creditScreenAdvances,
                  img: 'assets/images/money_tiket.svg',
                ),
                CardSelected(
                  key: Key('selected-card-pay-installment'),
                  text: I18n.of(context).creditScreenInstallments,
                  img: 'assets/images/calendar.svg',
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 35.0),
              child: RaisedButton(
                key: Key('raisedButton-accept'),
                onPressed: () => _showDialog(context, menuNavigatorBloc),
                color: Theme.of(context).colorScheme.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  I18n.of(context).actionTextRequest,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _showDialog(BuildContext context, menuNavigatorBloc) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomModal(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 45,
            child: PreApprovedCreditModal(
              navigateBloc: menuNavigatorBloc,
            ),
          );
        });
  }
}
