import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ExemptionsButton extends StatelessWidget {
  const ExemptionsButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          FlatButton(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Theme.of(context).colorScheme.grayColor[400]),
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () => _showDialog(context),
              child: Text(
                I18n.of(context).exemptionsExonerate,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[400],
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2.8,
                ),
              )),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 13),
              children: <TextSpan>[
                TextSpan(
                    text: I18n.of(context).exemptionsAllDefaultInterest,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.grayColor[300])),
                TextSpan(
                    text: I18n.of(context).exemptionsDefault,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.grayColor[300])),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _showDialog(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ImageBottomModal(
          modalHeight: 45.0,
          image: 'assets/images/bot_debt.svg',
          isImageBg: false,
          title: I18n.of(context).exemptionsSureExonerate,
          titleBold: I18n.of(context).exemptionsQuestionsOrdinaryInterest,
          isBold: true,
          isBtnAccept: true,
          titleAcceptButton: I18n.of(context).exemptionsExonerate,
          titleCloseButton: I18n.of(context).administratorAssignmentClose,
          onPressAccept: () {},
          onPressCancel: () {
            Navigator.pop(context);
          },
        );
      });
}
