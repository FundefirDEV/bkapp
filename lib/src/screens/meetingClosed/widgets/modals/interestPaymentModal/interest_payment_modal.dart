import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/button_close_modal_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/interestPaymentModal/table_payment_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/interestPaymentModal/text_payment_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/widgets/accordion_modals_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';

class InterestPaymentModal extends StatelessWidget {
  const InterestPaymentModal(
      {Key key,
      @required this.image,
      @required this.listPartnertsPayments,
      @required this.totalInstallmentsPays,
      @required this.totalAdvanceInsterest})
      : super(key: key);
  final String image;
  final String totalInstallmentsPays;
  final String totalAdvanceInsterest;
  final List<PartnertsPayments> listPartnertsPayments;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(children: [
        TitleModalsMeeting(
          image: image,
          title: UtilsTools.titleCase(
              I18n.of(context).meetingClosedInterestPaymentOrdynary),
        ),
        TextPaymentModal(
            totalInstallmentsPays: totalInstallmentsPays,
            totalAdvanceInsterest: totalAdvanceInsterest),
        AccordionModalsMeeting(
          titleAccordion:
              I18n.of(context).meetingClosedInterestPayment.toUpperCase(),
          children: [
            TablePaymentModal(listPartnertsPayments: listPartnertsPayments)
          ],
        ),
        ButtonCloseModalMeeting()
      ]),
    );
  }
}
