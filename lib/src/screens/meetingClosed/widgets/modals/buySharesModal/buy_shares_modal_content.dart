import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/button_close_modal_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/buySharesModal/table_shares_modal_content.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/widgets/accordion_modals_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/buySharesModal/text_shares_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter/material.dart';

class BuyShareModalContent extends StatelessWidget {
  const BuyShareModalContent({Key key, this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final data = [
      {"name": "Javier", "quantity": "20", "total": r"$40.000.000"},
      {"name": "Marcos", "quantity": "30", "total": r"$70.000.00"}
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleModalsMeeting(
            image: image,
            title: UtilsTools.titleCase(
                I18n.of(context).meetingClosedPurchasedShares),
          ),
          TextSharesModal(),
          AccordionModalsMeeting(
            titleAccordion: I18n.of(context).meetingClosedPurchasedShares,
            children: [TableSharesModalContent(data: data)],
          ),
          ButtonCloseModalMeeting()
        ],
      ),
    );
  }
}
