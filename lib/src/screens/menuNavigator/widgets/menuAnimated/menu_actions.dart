import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../widgets.dart';
import 'menu_animation.dart';

class MenuActions extends StatelessWidget {
  MenuActions(
      {Key key,
      @required this.hasLoaded,
      @required this.controller,
      this.isPressed,
      this.oldIndex})
      : animation = MenuAnimation(controller),
        super(key: key);

  final int oldIndex;
  final bool hasLoaded;
  final AnimationController controller;
  final MenuAnimation animation;
  final Function isPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return IgnorePointer(
      ignoring: !hasLoaded,
      child: AnimatedOpacity(
        opacity: hasLoaded ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          height: SizeConfig.blockSizeVertical * 100,
          color: Colors.black.withAlpha(225),
          child: _menuContent(context),
        ),
      ),
    );
  }

  Widget _menuContent(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.read<MenuNavigatorBloc>();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 85,
        height: SizeConfig.blockSizeVertical * 66,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              I18n.of(context).mainMenuActionsTitle.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 3.0),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 8.0),
            _firstColumn(context),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.7),
            Container(
              width: double.infinity,
              child: ButtonLine(
                key: Key('meeting-button-line'),
                onPressed: () {
                  navigateBloc.add(ButtonPressed(
                      goTo: HomeRoutesConstant.meetingClosedScreen));
                  isPressed();
                },
                text: I18n.of(context).mainMenuActionsMeeting,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.7),
            _thirdColumn(context)
          ],
        ),
      ),
    );
  }

  Widget _firstColumn(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.read<MenuNavigatorBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 70.0,
          width: SizeConfig.blockSizeHorizontal * 40.0,
          child: ButtonLine(
            key: Key('credit-button-line'),
            onPressed: () {
              navigateBloc
                  .add(ButtonPressed(goTo: HomeRoutesConstant.creditScreen));
              isPressed();
            },
            text: I18n.of(context).mainMenuActionsCredit,
          ),
        ),
        Container(
          height: 70.0,
          width: SizeConfig.blockSizeHorizontal * 40.0,
          child: ButtonLine(
            key: Key('profits-button-line'),
            onPressed: () {
              // _showDialog(context, context.read<MenuNavigatorBloc>(), oldIndex);
              navigateBloc.add(
                  ButtonPressed(goTo: HomeRoutesConstant.profitPaymentScreen));
              isPressed();
            },
            text: I18n.of(context).mainMenuActionsProfits,
          ),
        ),
      ],
    );
  }

  Widget _thirdColumn(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.read<MenuNavigatorBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 70.0,
          width: SizeConfig.blockSizeHorizontal * 40.0,
          child: ButtonLine(
            key: Key('actions-button-line'),
            onPressed: () {
              navigateBloc
                  .add(ButtonPressed(goTo: HomeRoutesConstant.sharesScreen));
              isPressed();
            },
            text: I18n.of(context).mainMenuActionsActions,
          ),
        ),
        Container(
          height: 70.0,
          width: SizeConfig.blockSizeHorizontal * 40.0,
          child: ButtonLine(
            key: Key('partners-button-line'),
            onPressed: () {
              navigateBloc.add(
                  ButtonPressed(goTo: HomeRoutesConstant.addPartnerScreen));
              isPressed();
            },
            text: I18n.of(context).mainMenuActionsPartner,
          ),
        ),
      ],
    );
  }
}

void _showDialog(context, menuNavigatorBloc, oldIndex) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (_) {
        return ImageBottomModal(
            modalHeight: 45.0,
            image: 'assets/images/sad_bot.svg',
            isImageBg: false,
            title: I18n.of(context).modalTextsYourBkGroup,
            titleBold: I18n.of(context).modalTextsIsEnabled,
            isBold: true,
            isBtnAccept: false,
            titleCloseButton: I18n.of(context).administratorAssignmentClose,
            onPressCancel: () {
              menuNavigatorBloc.add(ButtonPressed(goTo: oldIndex));
              Navigator.pop(context);
            });
      });
}
