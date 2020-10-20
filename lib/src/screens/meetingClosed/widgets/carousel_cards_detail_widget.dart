import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/core/models/meeting_model.dart';
import 'package:bkapp_flutter/core/models/shares_current_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/card_detail_meeting_closed_widget.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class CarouselCardsDetailWidget extends StatelessWidget {
  final MeetingModel infoMeeting;
  final MeetingDetail meetingDetail;
  final SharesCurrentModel sharesCurrent;
  const CarouselCardsDetailWidget(
      {Key key,
      this.infoMeeting,
      this.meetingDetail,
      @required this.sharesCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MeetingProps> listDetailMeeting = _listDetailMeeting(context);
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Carousel(
        viewportFraction: 0.9,
        heigthContainer: 165,
        currentPage: 0,
        children: <Widget>[
          for (var detailMeeting in listDetailMeeting)
            CardDetailMeetingClosedWidget(
                meetingProps: detailMeeting,
                meetingDetail: meetingDetail,
                sharesCurrent: sharesCurrent)
        ],
      ),
    );
  }

  _listDetailMeeting(BuildContext context) {
    List<MeetingProps> list = new List<MeetingProps>();
    MeetingProps detailMeeting = new MeetingProps(
        title: infoMeeting.totalShares,
        subTitle: I18n.of(context).meetingClosedSharesPurchased,
        image: "shares_bought",
        value: infoMeeting.capitalAcumulable,
        descriptionValue: I18n.of(context).meetingClosedAccumulableToCapital);
    list.add(detailMeeting);
    detailMeeting = new MeetingProps(
        title: infoMeeting.creditsQuantity,
        subTitle: I18n.of(context).meetingClosedCreditsAwarded,
        image: "credit_given",
        value: infoMeeting.totalCredit);
    list.add(detailMeeting);
    detailMeeting = new MeetingProps(
        subTitle: I18n.of(context).meetingClosedCapitalSubscription,
        image: "capital_icon",
        value: infoMeeting.capitalBalance);
    list.add(detailMeeting);
    detailMeeting = new MeetingProps(
        subTitle: I18n.of(context).meetingClosedInterestPayment,
        image: "oridinary_interest",
        value: infoMeeting.totalOrdinaryInterest);
    list.add(detailMeeting);
    return list;
  }
}
