import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/card_detail_meeting_closed_widget.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class CarouselCardsDetailWidget extends StatelessWidget {
  final List listDetailMeetingClosed;
  const CarouselCardsDetailWidget({Key key, this.listDetailMeetingClosed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
