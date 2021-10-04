import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/meetingBloc/bloc/meeting_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/card_general_detail_meeting_widget.dart';
import 'package:bkapp_flutter/src/screens/meetingClosed/widgets/carousel_cards_detail_widget.dart';
import 'package:bkapp_flutter/src/widgets/errorPage/error_page.dart';
import 'package:bkapp_flutter/src/widgets/lineSeparator/line_separator_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class MeetingClosedScreen extends StatefulWidget {
  MeetingClosedScreen(
      {Key key, this.tokenUser, this.oldIndex, this.userName, this.role})
      : super(key: key);
  final String tokenUser;
  final String userName;
  final String role;
  final int oldIndex;

  @override
  _MeetingClosedState createState() => _MeetingClosedState();
}

class _MeetingClosedState extends State<MeetingClosedScreen> {
  bool isClosedMeeting;
  @override
  void initState() {
    isClosedMeeting = true;
    BlocProvider.of<MeetingBloc>(context)
        .add(MeetingInitialize(token: widget.tokenUser));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isAdmin = widget.role == 'admin';
    return BlocBuilder<MeetingBloc, MeetingState>(builder: (context, state) {
      if (state is MeetingLoaded) {
        final infoMeeting = state.infoMeeting;
        if (state.isClosedMeeting && !isClosedMeeting)
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _showDialogConfirm(context, () {
                    Navigator.pop(context);
                    isClosedMeeting = false;
                  }));
        return Container(
          child: AppBarWidget(
            key: Key('app-bar-widget-meeting-closed'),
            userName: widget.userName,
            container: Column(children: <Widget>[
              TitleHeaderWidget(
                  title: I18n.of(context).meetingClosedMeetingClosing,
                  oldIndex: widget.oldIndex,
                  menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
              CardGeneralDetailMeetingWidget(
                  cashBalance: infoMeeting.cashBalance,
                  badDebtReserve: infoMeeting.badDebtReserve,
                  earningByShare: infoMeeting.earningByShare,
                  fundReserve: infoMeeting.fundReserve),
              if (isAdmin) _buttonPayFee(context , state.closeMettingActivate),
              LineSeparatorWidget(),
              _subtitleDetailClosing(context),
              CarouselCardsDetailWidget(
                  infoMeeting: infoMeeting,
                  meetingDetail: state.meetingDetail,
                  sharesCurrent: state.sharesCurrent)
            ]),
          ),
        );
      }
      if (state is MeetingFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      return Center(child: CircularProgressIndicator());
    });
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

  Padding _buttonPayFee(BuildContext context , bool closeMettingActivate) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: RaisedButton(
          key: Key('raisedButton-pay-fee'),
          onPressed: closeMettingActivate?   () {
            _showDialog(
                context,
                I18n.of(context).meetingClosedQuestionMeetingClosed1,
                I18n.of(context).meetingClosedQuestionMeetingClosed2,
                true,
                true,
                'assets/images/salo_pre_approved_modal.svg', () {
              isClosedMeeting = false;
              Navigator.pop(context);
              context
                  .read<MeetingBloc>()
                  .add(MeetingClosed(token: widget.tokenUser));
            });
          } : null,
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

void _showDialog(
    context, title, titleBold, isBold, isImageBg, image, Function function) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ImageBottomModal(
          modalHeight: 45.0,
          image: image,
          isImageBg: isImageBg,
          title: title,
          titleBold: titleBold,
          isBold: isBold,
          isBtnAccept: true,
          titleAcceptButton: I18n.of(context).administratorAssignmentAccept,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressAccept: function,
          onPressCancel: () => {Navigator.pop(context)},
        );
      });
}

void _showDialogConfirm(context, Function function) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ImageBottomModal(
          modalHeight: 45.0,
          image: 'assets/images/salo_pre_approved_modal.svg',
          isImageBg: true,
          title: I18n.of(context).meetingClosedCloseMeeting,
          titleBold: '',
          isBold: false,
          isBtnAccept: false,
          titleAcceptButton: I18n.of(context).administratorAssignmentAccept,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressAccept: function,
          onPressCancel: () => {Navigator.pop(context)},
        );
      });
}
