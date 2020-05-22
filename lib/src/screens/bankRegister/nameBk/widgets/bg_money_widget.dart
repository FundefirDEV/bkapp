import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgMoneyWidget extends StatelessWidget {
  const BgMoneyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('container-money-bg-svg'),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/images/money.svg', 
        key:Key('money-bg-svg'),
        height: SizeConfig.blockSizeVertical * 26
      ),
    );
  }
}
