import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterSelectCityWidget extends StatelessWidget {
  const FooterSelectCityWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('footer-select-city-container'),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            key: Key('footer-select-city-text-container'),
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
          Material(
            color: Colors.transparent,
            child: InkWell(
              key: Key('inkwell-select-city-redirect'),
              onTap: () {
                _nextStepWidget(context);
              },
              child: Container(
                key: Key('footer-select-city-image-container'),
                margin:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
                child: SvgPicture.asset('assets/images/path.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _nextStepWidget(BuildContext context) {
    Navigator.pushNamed(context, nameBkRoute);
  }
}
