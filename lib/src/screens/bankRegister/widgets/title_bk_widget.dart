import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';

class TitleBkWidget extends StatelessWidget {
  const TitleBkWidget({
    Key key,
    @required this.firstText,
    @required this.secondText
  }) : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      key: Key('title-bk-register'),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
      child: Column(
        children: <Widget>[
          Text(
            firstText,
            key: Key('text1-bk-register'),
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.blockSizeHorizontal * 5.5
            )
          ),
          Text(
            secondText,
            key: Key('text2-bk-register'),
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5.5
            )
          )
        ],
      ),
    );
  }
}
