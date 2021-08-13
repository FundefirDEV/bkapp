import 'package:bkapp_flutter/src/routes/route_constants.dart';
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
          Material(
            color: Colors.transparent,
            child: InkWell(
              key: Key('inkwell-number-page-redirect'),
              onTap: () {
                _prevStepWidget(context);
              },
              child: Container(
                key: Key('footer-name-bk-image-left-container'),
                margin: EdgeInsets.only(right: 10.0),
                child: SvgPicture.asset('assets/images/left_arrow.svg'),
              ),
            ),
          ),
          Container(
            key: Key('footer-name-bk-text-container'),
            margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 6,
              right: SizeConfig.blockSizeHorizontal * 16
            ),
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
          ),
        ],
      ),
    );
  }

  void _prevStepWidget(BuildContext context) {
    Navigator.pushNamed(context, addPartnersRegisterRoute , arguments: {'token' : ''});
  }
}
