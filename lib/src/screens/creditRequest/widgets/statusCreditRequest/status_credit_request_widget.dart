import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/description_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/status_text_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/text_image_credit_status_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StatusCreditRequestWidget extends StatefulWidget {
  StatusCreditRequestWidget(
      {Key key, @required this.userName, this.myCreditRequest})
      : super(key: key);

  final String userName;
  final Request myCreditRequest;

  @override
  _StatusCreditRequestWidgetState createState() =>
      _StatusCreditRequestWidgetState();
}

class _StatusCreditRequestWidgetState extends State<StatusCreditRequestWidget> {
  @override
  Widget build(BuildContext context) {
    String dateExist = widget.myCreditRequest?.requestDate ?? '';
    DateTime date =
        dateExist != '' ? DateTime.parse(dateExist) : DateTime.now();

    SizeConfig().init(context);
    return AppBarWidget(
      userName: widget.userName,
      container: Column(
        key: Key('status-credit_request-widget-column'),
        children: <Widget>[
          TitleHeaderWidget(
              title: I18n.of(context).approvalsScreenCredits,
              oldIndex: HomeRoutesConstant.homeScreen,
              menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
          Container(
            key: Key('status-credit_request-widget-container-text'),
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              I18n.of(context).statusCreditNormal,
              key: Key('status-credit_request-widget-text'),
              style: TextStyle(color: Colors.white, letterSpacing: 3.02),
            ),
          ),
          CardInformationBkWidget(
            childBlue: StatusTextCreditRequest(
              installments: widget.myCreditRequest?.installments ?? '0',
            ),
            childWhite: DescriptionCreditRequestWidget(
                valueRequested: widget.myCreditRequest?.amount ?? '\$0',
                dateRequested:
                    DateFormat("dd-MM-yyyy").format(date).toString()),
          ),
          TextImageCreditStatusWidget()
        ],
      ),
    );
  }
}
