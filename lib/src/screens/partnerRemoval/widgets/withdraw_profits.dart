import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class WithdrawProfits extends StatelessWidget {
  const WithdrawProfits({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 35.0),
              child: Text(I18n.of(context).partnerRemovalRemoval,
                  style: TextStyle(letterSpacing: 3.31))),
          MultipleButtons(
            isBtnAcept: true,
            titleAcceptButton: I18n.of(context).partnerRemovalProfits,
            titleCloseButton: I18n.of(context).partnerRemovalShares,
            onPressAccept: () {
              // _withDrawProfitsModal(context, () {});
              _withDrawMoney(context);
            },
            onPressCancel: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
            child: Text(
              I18n.of(context).partnerRemovalInfoText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    );
  }

  void _withDrawProfitsModal(context, onPress) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return ImageBottomModal(
              modalHeight: 45.0,
              image: 'assets/images/sad_bot.svg',
              isImageBg: false,
              title: I18n.of(context).partnerRemovalModalRemovalTitle1,
              titleBold: I18n.of(context).partnerRemovalModalRemovalTitle2,
              isBold: true,
              isBtnAccept: true,
              titleCloseButton: I18n.of(context).administratorAssignmentClose,
              titleAcceptButton: I18n.of(context).partnerRemovalRemoval,
              onPressAccept: () {},
              onPressCancel: () => Navigator.pop(context),
              buttonsFontSize: 14.0);
        });
  }

  void _withDrawMoney(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return BottomModal(
            height: 300.0,
            modalPadding: EdgeInsets.only(top: 10.0, bottom: 13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      r'$400.000',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 2.0),
                    ),
                    Text(
                      I18n.of(context).homeScreenEarnings,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.5),
                    ),
                  ],
                ),
                // TextFieldBlocBuilder(),
                Column(
                  children: [
                    Container(width: 80.0, child: TextField()),
                    SizedBox(height: 17.0),
                    Text(I18n.of(context).partnerRemovalAddShares,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100)),
                  ],
                ),
                MultipleButtons(
                  titleAcceptButton: I18n.of(context).partnerRemovalRemoval,
                  titleCloseButton: I18n.of(context).actionTextClose,
                  onPressAccept: () {},
                  onPressCancel: () => Navigator.pop(context),
                )
              ],
            ),
          );
        });
  }
}
