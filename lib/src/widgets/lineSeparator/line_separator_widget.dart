import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class LineSeparatorWidget extends StatelessWidget {
  LineSeparatorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('line-separator'),
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 3.5),
      height: 5.0,
      width: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
    );
  }
}
