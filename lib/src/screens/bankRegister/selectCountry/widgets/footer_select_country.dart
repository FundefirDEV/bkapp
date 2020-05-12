import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterSelectCountry extends StatelessWidget {
  const FooterSelectCountry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('footer-select-country-container'),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical *6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: Key('footer-select-country-text-container'),
            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 13),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '1 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '/ 4',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            key: Key('footer-select-country-image-container'),
            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
            child: SvgPicture.asset(
              'assets/images/path.svg'
            ),
          )
        ],
      ),
    );
  }
}
