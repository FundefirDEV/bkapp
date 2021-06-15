import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

import '../screens.dart';
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

class _BuySharesScreenState extends State<BuySharesScreen> {
  @override
  void initState() {
    context
        .read<BuySharesBloc>()
        .add(BuySharesInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<BuySharesBloc, BuySharesState>(
        builder: (context, state) {
      if (state is BuySharesLoaded) {
        if (state.infoShares.approvals.myRequest.sharesRequest.length > 0) {
          return ConfirmationBuyShares(
              approvals: state.infoShares.approvals, userName: widget.userName);
        } else {
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
                          print('Submiting');
                        },
                        onLoading: (context, state) {
                          CircularProgressIndicator();
                        },
                        onSuccess: (context, state) {
                          Navigator.pop(context);
                          _showDialog(context, () {
                            context.read<BuySharesBloc>().add(
                                BuySharesInitialize(token: widget.tokenUser));
                            Navigator.pop(context);
                          });
                        },
                        onFailure: (context, state) {
                          Navigator.pop(context);
                          UtilsTools.showErrorDialog(
                              context, state.failureResponse);
                        },
                        child: Column(
                          key: Key('column-buy-share-screen'),
                          children: <Widget>[
                            TitleHeaderWidget(
                                title: I18n.of(context).buySharesActions,
                                oldIndex: 0,
                                menuNavigatorBloc:
                                    context.read<MenuNavigatorBloc>()),
                            CardInformationBkWidget(
                                childBlue: NumberActions(
                                    myShares: state.infoShares.shares),
                                childWhite: ValueActions(
                                    valueShare: state.infoShares.shareValue,
                                    sharesAvailable: state.infoShares
                                        .maxQuantitySharesForBuyByPartner)),
                            SharesBuyText(textBuyShares: true),
                            BuySharesFormWidget(
                                token: widget.tokenUser,
                                valueShareRuleBank: state.infoShares.shareValue,
                                buySharesBloc:
                                    context.read<BuySharesFormBloc>())
                          ],
                        ),
                      ),
                    ))),
              );
            },
          );
        }
      }
      if (state is BuySharesFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

void _showLoading(context) {
  showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return Container(
            height: SizeConfig.blockSizeVertical * 100,
            child: Center(child: CircularProgressIndicator()));
      });
}

void _showDialog(context, onPress) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return ImageBottomModal(
            modalHeight: 45.0,
            image: 'assets/images/salo_pre_approved_modal.svg',
            isImageBg: true,
            title: I18n.of(context).preApprovedSharesModalSharesrequest,
            titleBold: I18n.of(context).preApprovedCreditModalPreApproved,
            isBold: true,
            isBtnAccept: false,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressCancel: onPress);
      });
}
