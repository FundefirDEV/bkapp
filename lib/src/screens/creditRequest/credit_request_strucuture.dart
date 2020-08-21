import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/widgets.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/modals/preApprovedRequest/pre_approved_credit_modal.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class CreditRequestStructure extends StatelessWidget {
  const CreditRequestStructure({
    Key key,
    @required this.oldIndex,
    @required this.tokenUser,
    this.userName
  }) : super(key: key);

  final int oldIndex;
  final String tokenUser;
  final String userName;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);

    return Builder(
      builder: (context) {
        // ignore: close_sinks
        CreditFormBloc creditFormBloc = context.bloc<CreditFormBloc>();
        return FormBlocListener<CreditFormBloc, String, String>(
          key: Key('bloc-listener-buy-share-screen'),
          onSubmitting: (context, state) {
            print('Loading');
          },
          onSuccess: (context, state) {
            _showDialog(context, menuNavigatorBloc);
          },
          onFailure: (context, state) {
            UtilsTools.showErrorDialog(context, state.failureResponse);
          },
          child: AppBarWidget(
            userName: userName,
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
                margin:
                    EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
                child: Text(I18n.of(context).creditScreenCreditRequest,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 5,
                        color: Theme.of(context).colorScheme.grayColor[300],
                        fontWeight: FontWeight.w100)),
              ),
              FormFields(creditFormBloc: creditFormBloc),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 3
                ),
                child: Text(I18n.of(context).creditScreenWayToPay,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                        color: Theme.of(context).colorScheme.grayColor[300],
                        fontWeight: FontWeight.w100)),
              ),
              SelectedPayInstallmentsWidget(
                onTabSelected: (item) => creditFormBloc.paymentMethods.updateValue(item),
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
                  onPressed: () {
                    context.bloc<CreditFormBloc>()
                      .tokenProfile.updateValue(tokenUser);
                    creditFormBloc.submit();
                  },
                  color: Theme.of(context).colorScheme.primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 12.0
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
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
          )),
        );
      },
    );
  }

  void _showDialog(BuildContext context, menuNavigatorBloc) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<ApprovalsBloc>(context),
          child: BottomModal(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 45,
            child: PreApprovedCreditModal(
              navigateBloc: menuNavigatorBloc,
              tokenUser: tokenUser,
            ),
          ),
        );
      }
    );
  }
}