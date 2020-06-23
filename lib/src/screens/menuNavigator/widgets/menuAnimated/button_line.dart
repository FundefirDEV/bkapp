import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class ButtonLine extends StatelessWidget {
  const ButtonLine({
    Key key,
    @required this.onPressed,
    @required this.text
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return OutlineButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w100,
          letterSpacing: 1.0
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 2.0
      ),
      borderSide: BorderSide(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
