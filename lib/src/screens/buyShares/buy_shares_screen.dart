import 'package:bkapp_flutter/core/bloc/approvalBloc/approvals_bloc.dart';
import 'package:bkapp_flutter/core/bloc/buySharesBloc/buy_shares_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/buyShares/widgets/titleBuyShares/title_buy_share_widget.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'widgets/cardBuyShares/buy_shares_form_widget.dart';
import 'widgets/cardBuyShares/number_actions_widget.dart';
import 'widgets/cardBuyShares/shares_buy_text_widget.dart';
import 'widgets/cardBuyShares/value_actions_widget.dart';

class BuySharesScreen extends StatefulWidget {
  BuySharesScreen(
      {Key key,
      @required this.oldIndex,
      this.userName,
      @required this.tokenUser})
      : super(key: key);
  final int oldIndex;
  final String userName;
  final String tokenUser;

  @override
  _BuySharesScreenState createState() => _BuySharesScreenState();
}

class _BuySharesScreenState extends State<BuySharesScreen>
    with AfterLayoutMixin<BuySharesScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    context
        .bloc<ApprovalsBloc>()
        .add(ApprovalsInitialize(token: widget.tokenUser));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);
    return BlocBuilder<ApprovalsBloc, ApprovalsState>(
        builder: (context, state) {
      if (state is ApprovalsLoaded) {
        if (state.approvals['myRequest']['sharesRequest'].length <= 0) {
          return Builder(
            key: Key('builder-buy-share-screen'),
            builder: (context) {
              return Material(
                key: Key('material-buy-share-screen'),
                color: Theme.of(context).colorScheme.grayColor[50],
                child: AppBarWidget(
                    key: Key('appbar-buy-share-screen'),
                    userName: widget.userName,
                    container: Container(
                        child: Container(
                      key: Key('container-buy-share-screen'),
                      child:
                          FormBlocListener<BuySharesFormBloc, String, String>(
                        key: Key('bloc-listener-buy-share-screen'),
                        onSubmitting: (context, state) {
                          print('Loading');
                        },
                        onSuccess: (context, state) {
                          _showDialog(context, menuNavigatorBloc);
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
                            BuySharesFormWidget(
                                token: widget.tokenUser,
                                buySharesBloc:
                                    context.bloc<BuySharesFormBloc>())
                          ],
                        ),
                      ),
                    ))),
              );
            },
          );
        } else {
          context.bloc<MenuNavigatorBloc>().add(ButtonPressed(goTo: 7));
        }
      }
      if (state is ApprovalsFailure) {
        return Text('Se ha presentado un error, intenta nuevamente');
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

void _showDialog(context, menuNavigatorBloc) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ImageBottomModal(
            modalHeight: 45.0,
            image: 'assets/images/salo_pre_approved_modal.svg',
            isImageBg: true,
            title: I18n.of(context).preApprovedSharesModalSharesrequest,
            titleBold: I18n.of(context).preApprovedCreditModalPreApproved,
            isBold: true,
            isBtnAccept: false,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressCancel: () {
              menuNavigatorBloc.add(ButtonPressed(goTo: 7));
              Navigator.pop(context);
            });
      });
}
