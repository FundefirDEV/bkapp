import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class ButtonLineRoundedWidget extends StatelessWidget {
  const ButtonLineRoundedWidget(
      {Key key,
      @required this.firstText,
      this.secondText,
      @required this.onPressed})
      : super(key: key);

  final String firstText;
  final String secondText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: Container(
        key: Key('container-flatbutton-footer'),
        child: FlatButton(
          key: Key('flatbutton-create-bk'),
          child: Padding(
              key: Key('padding-label-button-create'),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _buttonText(mainText: firstText, secondText: secondText)),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}

Widget _buttonText({String mainText, String secondText}) {
  return RichText(
    key: Key('button-text-line-rounded'),
    text: TextSpan(
      text: mainText,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w200,
        letterSpacing: 1.5,
      ),
      children: <TextSpan>[
        if (secondText != null) ...[
          TextSpan(
              text: secondText, style: TextStyle(fontWeight: FontWeight.w700))
        ]
      ],
    ),
  );
}
