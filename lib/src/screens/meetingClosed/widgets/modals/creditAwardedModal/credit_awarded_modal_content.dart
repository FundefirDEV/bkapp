import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/button_close_modal_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/creditAwardedModal/credit_awarded_detail.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/widgets/accordion_modals_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/creditAwardedModal/table_modal_credit_awarded.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter/material.dart';

class CreditAwardedModalContent extends StatelessWidget {
  const CreditAwardedModalContent({Key key, this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        "name": "Javier",
        "quantity": r"$10.000.000",
        "interest": r"$40.000.000"
      },
      {"name": "Marcos", "quantity": r"$90.000.000", "interest": r"$70.000.00"}
    ];
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
          CreditAwardedDetail(),
          AccordionModalsMeeting(
            titleAccordion: I18n.of(context).meetingClosedCreditsAwarded,
            children: [TableModalCreditAwarded(data: data)],
          ),
          ButtonCloseModalMeeting()
        ],
      ),
    );
  }
}
