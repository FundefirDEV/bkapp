import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberStepBkWidget extends StatelessWidget {
  const NumberStepBkWidget({
    Key key,
    @required this.currentIndex,
    @required this.itemsLength,
    this.prevRoute,
    this.nextRoute,
  }) : super(key: key);

  final int currentIndex;
  final int itemsLength;
  final Function prevRoute;
  final Function nextRoute;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double offset = SizeConfig.blockSizeHorizontal * 13;
    double marginSides = SizeConfig.blockSizeHorizontal * 6;

    return Container(
      child: Row(
        key: Key('row-content-image-text-footer'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (prevRoute != null) ...[
            Material(
              color: Colors.transparent,
              child: InkWell(
                key: Key('inkwell-prev-page-redirect'),
                onTap: prevRoute,
                child: Container(
                  key: Key('footer-name-bk-image-left-container'),
                  margin: EdgeInsets.only(
                    right: 10.0
                  ),
                  child: SvgPicture.asset('assets/images/left_arrow.svg'),
                ),
              ),
            ),
          ],
          Container(
            key: Key('footer-name-bk-text-container'),
            margin: EdgeInsets.only(
              left: prevRoute != null ? marginSides : offset,
              right: nextRoute != null ? marginSides : offset
            ),
            child: RichText(
              key: Key('number-page-text'),
              text: TextSpan(
                children: [
                  TextSpan(
                    text: currentIndex.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' / ${itemsLength.toString()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (nextRoute != null) ...[
            Material(
              color: Colors.transparent,
              child: InkWell(
                key: Key('inkwell-next-page-redirect'),
                onTap: nextRoute,
                child: Container(
                  key: Key('footer-name-bk-image-left-container'),
                  margin: EdgeInsets.only(
                    left: 10.0
                  ),
                  child: SvgPicture.asset('assets/images/path.svg'),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
