import 'package:bkapp_flutter/core/bloc/approvalBloc/approvals_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/cards_approvals_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RequestShareCard extends StatelessWidget {
  final int index;
  final int id;
  final String partnerName;
  final double amount;
  final int quantity;
  final String requestDate;
  final String token;
  final String type;
  final String role;

  const RequestShareCard(
      {Key key,
      this.id,
      this.partnerName,
      this.amount,
      this.requestDate,
      this.index,
      this.quantity,
      this.token,
      this.type,
      this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<ApprovalsBloc, ApprovalsState>(
        builder: (context, state) {
      if (state is ApprovalsLoaded) {
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CardsApprovalsContent(
                    amount: amount,
                    partnerName: partnerName,
                    quantity: quantity,
                    type: type,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        key: Key('inkwell-approve-modal-request-card-$index'),
                        onTap: () {
                          _showDialog(
                              context,
                              I18n.of(context).approvalsScreenConfirmApprove,
                              I18n.of(context)
                                      .approvalsScreenConfirmApproveBold +
                                  '${this.partnerName}?',
                              true,
                              true,
                              'assets/images/salo_pre_approved_modal.svg', () {
                            Navigator.pop(context);
                            context.bloc<ApprovalsBloc>().add(ApprovalsPost(
                                token: token,
                                approvalStatus: 'approve',
                                idRequest: id,
                                requestType: type));
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/images/approve.svg',
                          height: SizeConfig.blockSizeVertical * 6,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _showDialog(
                              context,
                              I18n.of(context).approvalsScreenDeclineApprove,
                              I18n.of(context)
                                      .approvalsScreenConfirmApproveBold +
                                  '${this.partnerName}?',
                              true,
                              false,
                              'assets/images/sad_bot.svg', () {
                            Navigator.pop(context);
                            context.bloc<ApprovalsBloc>().add(ApprovalsPost(
                                token: token,
                                approvalStatus: 'rejected',
                                idRequest: id,
                                requestType: type));
                          });
                        },
                        child: Container(
                            height: 35,
                            width: 50,
                            child: SvgPicture.asset(
                              'assets/images/reject.svg',
                              fit: BoxFit.none,
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ));
      }
      if (state is ApprovalsFailure) {
        return ErrorPage();
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

void _showDialog(
    context, title, titleBold, isBold, isImageBg, image, Function function) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ImageBottomModal(
          modalHeight: 45.0,
          image: image,
          isImageBg: isImageBg,
          title: title,
          titleBold: titleBold,
          isBold: isBold,
          isBtnAccept: true,
          titleAcceptButton: I18n.of(context).administratorAssignmentAccept,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressAccept: function,
          onPressCancel: () => {Navigator.pop(context)},
        );
      });
}
