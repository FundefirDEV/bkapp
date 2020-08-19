import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class ButtonLineRoundedWidget extends StatelessWidget {
  const ButtonLineRoundedWidget(
      {Key key,
      @required this.firstText,
      this.secondText,
      @required this.onPressed,
      this.color})
      : super(key: key);

  final String firstText;
  final String secondText;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: Container(
        key: Key('container-flatbutton-footer'),
        child: FlatButton(
          key: Key('flatbutton-create-bk'),
          color: color,
          child: Padding(
              key: Key('padding-label-button-create'),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _buttonText(mainText: firstText, secondText: secondText)),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              side: color == Colors.transparent
                  ? BorderSide(color: Colors.white, style: BorderStyle.solid)
                  : BorderSide(
                      color: Colors.transparent, style: BorderStyle.solid),
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
        fontWeight: FontWeight.w300,
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
