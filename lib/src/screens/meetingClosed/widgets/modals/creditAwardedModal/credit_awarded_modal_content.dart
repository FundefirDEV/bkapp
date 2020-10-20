import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/button_close_modal_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/creditAwardedModal/credit_awarded_detail.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/widgets/accordion_modals_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/creditAwardedModal/table_modal_credit_awarded.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter/material.dart';

class CreditAwardedModalContent extends StatelessWidget {
  const CreditAwardedModalContent(
      {Key key,
      @required this.image,
      @required this.listCreditsThisMeeting,
      @required this.cashBalance,
      @required this.activeCredits})
      : super(key: key);
  final String image;
  final String cashBalance;
  final String activeCredits;
  final List<CreditsThisMeeting> listCreditsThisMeeting;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleModalsMeeting(
            image: image,
            title: UtilsTools.titleCase(
                I18n.of(context).meetingClosedCreditsAwarded),
          ),
          CreditAwardedDetail(
              activeCredits: activeCredits, cashBalance: cashBalance),
          AccordionModalsMeeting(
            titleAccordion: I18n.of(context).meetingClosedCreditsAwarded,
            children: [
              TableModalCreditAwarded(
                  listCreditsThisMeeting: listCreditsThisMeeting)
            ],
          ),
          ButtonCloseModalMeeting()
        ],
      ),
    );
  }
}
