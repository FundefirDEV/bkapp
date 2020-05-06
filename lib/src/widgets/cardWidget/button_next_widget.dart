import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonNextWidget extends StatelessWidget {
  final Function onTap;

  const ButtonNextWidget({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: this.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockVertical * 3,
            vertical: SizeConfig.safeBlockVertical * 3),
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.safeBlockHorizontal * 20,
            height: SizeConfig.safeBlockVertical * 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryColor[50],
                      Theme.of(context).colorScheme.primaryColor[100]
                    ],
                    stops: [0, 1],
                    begin: Alignment(-1.00, 0.00),
                    end: Alignment(1.00, -0.00))),
            child: SvgPicture.asset('assets/images/path.svg'),
          ),
        ),
      ),
    );
  }
}
