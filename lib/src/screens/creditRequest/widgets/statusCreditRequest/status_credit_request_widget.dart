import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/descriptionCreditRequest/description_credit_request_widget.dart';
import 'widgets/statusTextCreditRequest/status_text_credit_request_widget.dart';
import 'widgets/textImageCreditStatus/text_image_credit_status_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StatusCreditRequestWidget extends StatefulWidget {
  StatusCreditRequestWidget({Key key}) : super(key: key);

  @override
  _StatusCreditRequestWidgetState createState() =>
      _StatusCreditRequestWidgetState();
}

class _StatusCreditRequestWidgetState extends State<StatusCreditRequestWidget> {
  @override
  Widget build(BuildContext context) {
    final navigateBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);
    return AppBarWidget(
      container: Column(
        key: Key('status-credit_request-widget-column'),
        children: <Widget>[
          TitleHeaderWidget(
            title: I18n.of(context).approvalsScreenCredits,
            oldIndex: 0,
            navigateBloc: navigateBloc,
          ),
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
            childBlue: StatusTextCreditRequest(),
            childWhite: DescriptionCreditRequestWidget(),
          ),
          TextImageCreditStatusWidget(),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 3),
              key: Key('close_container_invite_modal'),
              child: FlatButton(
                  key: Key('flat_button_credit_active'),
                  onPressed: () {
                    navigateBloc.add(ButtonPressed(goTo: 11));
                  },
                  child: Text(
                    'VIEW CREDIT',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )))
        ],
      ),
    );
  }
}
