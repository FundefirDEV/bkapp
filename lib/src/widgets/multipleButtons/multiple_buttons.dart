import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class MultipleButtons extends StatelessWidget {
  const MultipleButtons(
      {Key key,
      this.isBtnAcept: true,
      this.titleAcceptButton,
      this.titleCloseButton,
      this.onPressAccept,
      this.onPressCancel,
      this.isBtnCancel: true,
      this.fontSize: 15.0})
      : super(key: key);

  final bool isBtnAcept;
  final bool isBtnCancel;
  final String titleAcceptButton;
  final String titleCloseButton;
  final Function onPressAccept;
  final Function onPressCancel;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('row_image_botton_modal'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (isBtnAcept)
          FlatButton(
              key: Key('flat_button_accept_multiple_buttons'),
              color: Theme.of(context).colorScheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: onPressAccept,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  titleAcceptButton,
                  key: Key('text_button_accept'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2.8,
                  ),
                ),
              )),
        if (isBtnCancel)
          FlatButton(
              key: Key('flat_button_cancel_multiple_buttons'),
              onPressed: onPressCancel,
              child: Text(
                titleCloseButton,
                key: Key('text_button_cancel'),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2.8,
                ),
              )),
      ],
    );
  }
}
