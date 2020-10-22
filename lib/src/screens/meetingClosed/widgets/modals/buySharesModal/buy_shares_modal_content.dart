import 'package:bkapp_flutter/core/models/shares_current_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/button_close_modal_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/buySharesModal/table_shares_modal_content.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/widgets/accordion_modals_meeting.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/modals/buySharesModal/text_shares_modal.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/title_modals_meeting.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:flutter/material.dart';

class BuyShareModalContent extends StatelessWidget {
  const BuyShareModalContent({Key key, this.image, this.sharesCurrent})
      : super(key: key);

  final String image;
  final SharesCurrentModel sharesCurrent;
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
                I18n.of(context).meetingClosedPurchasedShares),
          ),
          TextSharesModal(
              newCashBalance: sharesCurrent.newCashBalance,
              lastCashBalance: sharesCurrent.lastCashBalance,
              payShares: sharesCurrent.totalSharesMeeting),
          AccordionModalsMeeting(
            titleAccordion: I18n.of(context).meetingClosedPurchasedShares,
            children: [
              TableSharesModalContent(data: sharesCurrent.sharesByPartners)
            ],
          ),
          ButtonCloseModalMeeting()
        ],
      ),
    );
  }
}
