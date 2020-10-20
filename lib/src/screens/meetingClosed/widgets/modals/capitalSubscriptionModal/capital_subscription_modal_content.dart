import 'package:bkapp_flutter/core/models/meeting_detail_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/capitalSubscriptionModal/capital_text_subscription.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/capitalSubscriptionModal/table_subscription_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../button_close_modal_meeting.dart';

class CapitalSubscriptionModalContent extends StatelessWidget {
  const CapitalSubscriptionModalContent(
      {Key key,
      @required this.image,
      @required this.listPartnertsPayments,
      @required this.totalCapital})
      : super(key: key);
  final String image;
  final String totalCapital;
  final List<PartnertsPayments> listPartnertsPayments;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(children: [
        TitleModalsMeeting(
          image: image,
          title: UtilsTools.titleCase(
              I18n.of(context).meetingClosedCapitalSubscription),
        ),
        SizedBox(
          height: 30,
        ),
        CapitalTextSubscription(totalCapital: totalCapital),
        TableSubscriptionModal(
            listPartnertsPayments: this.listPartnertsPayments),
        ButtonCloseModalMeeting()
      ]),
    );
  }
}
