import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BgOval extends StatelessWidget {
  const BgOval({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          width: SizeConfig.blockSizeHorizontal * 100,
          child: SvgPicture.asset('assets/images/oval.svg', fit: BoxFit.cover),
      ),
    );
  }
}
