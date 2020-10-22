import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ButtonCloseModalMeeting extends StatelessWidget {
  const ButtonCloseModalMeeting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          I18n.of(context).actionTextClose,
          style: TextStyle(
            color: Theme.of(context).colorScheme.grayColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 2.8,
          ),
        ));
  }
}
