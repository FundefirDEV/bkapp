import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/button_close_modal_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/interestPaymentModal/table_payment_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/interestPaymentModal/text_payment_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/widgets/accordion_modals_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';

class InterestPaymentModal extends StatelessWidget {
  const InterestPaymentModal({Key key, this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    final data = [
      {"name": "Javier", "quantity": r"$10.000", "total": "Cuota"},
      {"name": "Marcos", "quantity": r"$5.000", "total": "Adelantado"},
      {"name": "Marcos", "quantity": r"$20.000", "total": "Mora"}
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(children: [
        TitleModalsMeeting(
          image: image,
          title: UtilsTools.titleCase(
              I18n.of(context).meetingClosedInterestPaymentOrdynary),
        ),
        TextPaymentModal(),
        AccordionModalsMeeting(
          titleAccordion:
              I18n.of(context).meetingClosedInterestPayment.toUpperCase(),
          children: [TablePaymentModal(data: data)],
        ),
        ButtonCloseModalMeeting()
      ]),
    );
  }
}
