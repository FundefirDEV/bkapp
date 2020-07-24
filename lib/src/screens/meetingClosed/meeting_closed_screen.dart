import 'dart:convert';

import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/card_general_detail_meeting_widget.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/carousel_cards_detail_widget.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class MeetingClosedScreen extends StatelessWidget {
  final int oldIndex;
  const MeetingClosedScreen({Key key, this.oldIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listDetailMeetingClosed = jsonDecode(
        '[{"title": "15", "subTitle": "${I18n.of(context).meetingClosedSharesPurchased}", "image": "shares_bought", "value": "1.000.000", "descriptionValue": "${I18n.of(context).meetingClosedAccumulableToCapital}"},' +
            '{"title": "2", "subTitle": "${I18n.of(context).meetingClosedCreditsAwarded}", "image": "credit_given", "value": "1.000.000", "descriptionValue": ""},' +
            '{"title": "", "subTitle": "${I18n.of(context).meetingClosedCapitalSubscription}", "image": "capital_icon", "value": "500.000", "descriptionValue": ""},' +
            '{"title": "", "subTitle": "${I18n.of(context).meetingClosedInterestPayment}", "image": "oridinary_interest", "value": "1.000", "descriptionValue": ""}]');

    // ignore: close_sinks
    MenuNavigatorBloc menuNavigatorBloc = context.bloc<MenuNavigatorBloc>();
    SizeConfig().init(context);
    return Container(
      child: AppBarWidget(
        key: Key('app-bar-widget-meeting-closed'),
        container: Column(children: <Widget>[
          TitleHeaderWidget(
            title: I18n.of(context).meetingClosedMeetingClosing,
            oldIndex: oldIndex,
            navigateBloc: menuNavigatorBloc,
          ),
          CardGeneralDetailMeetingWidget(),
          _buttonPayFee(context),
          LineSeparatorWidget(),
          _subtitleDetailClosing(context),
          CarouselCardsDetailWidget(
              listDetailMeetingClosed: listDetailMeetingClosed)
        ]),
      ),
    );
  }

  Container _subtitleDetailClosing(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
      child: Text(
        I18n.of(context).meetingClosedDetailClosing,
        key: Key('subtitle-detail-closing'),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
      ),
    );
  }

  Padding _buttonPayFee(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: RaisedButton(
          key: Key('raisedButton-pay-fee'),
          onPressed: () => {},
          color: Theme.of(context).colorScheme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: RichText(
              key: Key('text-button-meeting-closing'),
              text: TextSpan(
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4),
                  children: [
                    TextSpan(text: '${I18n.of(context).meetingClosedClosing} '),
                    TextSpan(
                        text: I18n.of(context).meetingClosedMeeting,
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ]))),
    );
  }
}
