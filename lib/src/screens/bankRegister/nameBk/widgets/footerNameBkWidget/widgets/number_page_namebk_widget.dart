import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberPageNameBkWidget extends StatelessWidget {
  const NumberPageNameBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Row(
        key: Key('row-content-image-text-footer'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: Key('footer-name-bk-image-left-container'),
            margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
            child: SvgPicture.asset(
              'assets/images/left_arrow.svg'
            ),
          ),
          Container(
            key: Key('footer-name-bk-text-container'),
            margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 13),
            child: RichText(
              key: Key('number-page-text'),
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '3 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '/ 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
