import 'dart:convert';
import 'package:bkapp_flutter/core/models/meeting_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/card_detail_meeting_closed_widget.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class CarouselCardsDetailWidget extends StatelessWidget {
  final MeetingModel infoMeeting;
  const CarouselCardsDetailWidget({Key key, this.infoMeeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listDetailMeetingClosed = jsonDecode(
        '[{"title": "${infoMeeting.totalShares}", "subTitle": "${I18n.of(context).meetingClosedSharesPurchased}", "image": "shares_bought", "value": "${infoMeeting.capitalAcumulable}", "descriptionValue": "${I18n.of(context).meetingClosedAccumulableToCapital}"},' +
            '{"title": "${infoMeeting.creditsQuantity}", "subTitle": "${I18n.of(context).meetingClosedCreditsAwarded}", "image": "credit_given", "value": "${infoMeeting.totalCredit}", "descriptionValue": ""},' +
            '{"title": "", "subTitle": "${I18n.of(context).meetingClosedCapitalSubscription}", "image": "capital_icon", "value": "${infoMeeting.capitalBalance}", "descriptionValue": ""},' +
            '{"title": "", "subTitle": "${I18n.of(context).meetingClosedInterestPayment}", "image": "oridinary_interest", "value": "${infoMeeting.totalOrdinaryInterest}", "descriptionValue": ""}]');

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Carousel(
        viewportFraction: 0.9,
        heigthContainer: 165,
        children: <Widget>[
          for (var i = 0; i < listDetailMeetingClosed.length; i++)
            CardDetailMeetingClosedWidget(
              title: listDetailMeetingClosed[i]["title"],
              subTitle: listDetailMeetingClosed[i]["subTitle"],
              image: listDetailMeetingClosed[i]["image"],
              value: listDetailMeetingClosed[i]["value"],
              descriptionValue: listDetailMeetingClosed[i]["descriptionValue"],
            )
        ],
      ),
    );
  }
}
