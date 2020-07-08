import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/descriptionCreditRequest/description_credit_request_widget.dart';
import 'widgets/statusTextCreditRequest/status_text_credit_request_widget.dart';
import 'widgets/textImageCreditStatus/text_image_credit_status_widget.dart';
import 'widgets/titleStausCredit/title_status_credit_widget.dart';

class StatusCreditRequestWidget extends StatefulWidget {
  StatusCreditRequestWidget({Key key}) : super(key: key);

  @override
  _StatusCreditRequestWidgetState createState() =>
      _StatusCreditRequestWidgetState();
}

class _StatusCreditRequestWidgetState extends State<StatusCreditRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      container: Column(
        key: Key('status-credit_request-widget-column'),
        children: <Widget>[
          TitleStatusCreditWidget(),
          Container(
            key: Key('status-credit_request-widget-container-text'),
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              I18n.of(context).statusCreditSpecial,
              key: Key('status-credit_request-widget-text'),
              style: TextStyle(color: Colors.white, letterSpacing: 3.02),
            ),
          ),
          CardInformationBkWidget(
            childBlue: StatusTextCreditRequest(),
            childWhite: DescriptionCreditRequestWidget(),
          ),
          TextImageCreditStatusWidget(),
        ],
      ),
    );
  }
}
