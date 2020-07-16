import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ButtonImageBottonModalWidget extends StatelessWidget {
  const ButtonImageBottonModalWidget(
      {Key key,
      this.isBtnAcept,
      this.titleAcceptButton,
      this.titleCloseButton,
      this.onPressAccept,
      this.onPressCancel})
      : super(key: key);

  final bool isBtnAcept;
  final String titleAcceptButton;
  final String titleCloseButton;
  final Function onPressAccept;
  final Function onPressCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('row_image_botton_modal'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (isBtnAcept)
          FlatButton(
              key: Key('flat_button_image_botton_modal_accept'),
              color: Theme.of(context).colorScheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: onPressAccept,
              child: Text(
                titleAcceptButton,
                key: Key('text_image_botton_modal_accept'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2.8,
                ),
              )),
        FlatButton(
            key: Key('flat_button_image_botton_modal_close'),
            onPressed: onPressCancel,
            child: Text(
              titleCloseButton,
              key: Key('text_image_botton_modal_close'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.grayColor,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 2.8,
              ),
            )),
      ],
    );
  }
}
