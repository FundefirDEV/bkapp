import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/core/models/shares_current_model.dart';
import 'package:bkapp_flutter/src/screens/approvals/widgets/empty_information.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/buySharesModal/buy_shares_modal_content.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/creditAwardedModal/credit_awarded_modal_content.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/interestPaymentModal/interest_payment_modal.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'modals/capitalSubscriptionModal/capital_subscription_modal_content.dart';

class CardDetailMeetingClosedWidget extends StatelessWidget {
  const CardDetailMeetingClosedWidget(
      {Key key,
      this.meetingProps,
      this.meetingDetail,
      @required this.sharesCurrent})
      : super(key: key);
  final MeetingProps meetingProps;
  final MeetingDetail meetingDetail;
  final SharesCurrentModel sharesCurrent;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: 150,
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 2,
            horizontal: SizeConfig.safeBlockHorizontal * 3),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0)
        ]),
        child: InkWell(
          onTap: () => _showDialog(context, meetingProps.image),
          child: Column(
            children: <Widget>[
              _titleCard(context),
              _containerCard(context),
            ],
          ),
        ));
  }

  Expanded _containerCard(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        child: SvgPicture.asset(
                            'assets/images/${meetingProps.image}.svg',
                            fit: BoxFit.contain),
                      ))),
              Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          key: Key(''),
                          text: TextSpan(
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.grayColor,
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w200),
                              children: [
                                TextSpan(text: meetingProps.value),
                                TextSpan(
                                    text: meetingProps.descriptionValue != null
                                        ? '\n${meetingProps.descriptionValue}'
                                        : '',
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700)),
                              ]))))
            ],
          ),
        ));
  }

  Expanded _titleCard(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryColor[100],
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: RichText(
                        key: Key(''),
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                  text: meetingProps.title != null
                                      ? '${meetingProps.title}\n'
                                      : ''),
                              TextSpan(
                                  text: meetingProps.subTitle,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200)),
                            ])),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: SvgPicture.asset('assets/images/path.svg',
                            fit: BoxFit.contain),
                      )))
            ],
          ),
        ));
  }

  void _showDialog(context, type) {
    SizeConfig().init(context);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BottomModal(
              height: SizeConfig.blockSizeVertical * 85,
              child: SingleChildScrollView(child: modalContent(type)));
        });
  }

  StatelessWidget modalContent(type) {
    switch (type) {
      case 'shares_bought':
        return BuyShareModalContent(image: type, sharesCurrent: sharesCurrent);
        break;
      case 'credit_given':
        return CreditAwardedModalContent(
            image: type,
            cashBalance: meetingDetail.cashBalance,
            activeCredits: meetingDetail.activeCredits,
            listCreditsThisMeeting: meetingDetail.creditsThisMeeting);
        break;
      case 'capital_icon':
        return CapitalSubscriptionModalContent(
            image: type,
            totalCapital: meetingDetail.totalCapital,
            listPartnertsPayments: meetingDetail.partnertsPayments);
        break;
      case 'oridinary_interest':
        return InterestPaymentModal(
            image: type,
            totalInstallmentsPays: meetingDetail.totalInstallmentsPays,
            totalAdvanceInsterest: meetingDetail.totalAdanceInsterest,
            listPartnertsPayments: meetingDetail.partnertsPayments);
        break;
      default:
        return EmptyInformation();
    }
  }
}

class MeetingProps {
  MeetingProps(
      {this.title,
      this.subTitle,
      this.image,
      this.value,
      this.descriptionValue});
  final String title;
  final String subTitle;
  final String image;
  final String value;
  final String descriptionValue;
}
