import 'package:bkapp_flutter/src/screens/introRegister/items_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/size_config.dart';

class Carousel extends StatelessWidget {
  final ItemCarousel item;
  const Carousel({Key key, this.item }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      child: Stack(
        key: Key('stack-carousel-container'),
        children: [
          Align(
            key: Key('shadow-carousel-container'),
            child: Container(
              height: SizeConfig.blockSizeVertical * 18,
              width: SizeConfig.blockSizeHorizontal * 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(
                      0,
                      10.0,
                    ),
                  )
                ],
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue[100],
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Positioned(
            key: Key('image-carousel-container'),
            left: SizeConfig.blockSizeHorizontal * 10,
            top: SizeConfig.blockSizeVertical * 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: SizeConfig.blockSizeHorizontal * 25,
                  height: SizeConfig.blockSizeVertical * 15,
                  child: SvgPicture.asset(item.image)
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 40,
                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                      text: item.text1,
                      style: TextStyle(color: Colors.black, fontSize: SizeConfig.blockSizeHorizontal * 4),
                      children: <TextSpan>[
                        TextSpan(text: item.text2, style: TextStyle(fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                ),
                
              ],
            )
          ),
          Align(
            key: Key('icon-carousel-container'),
            alignment: Alignment.bottomCenter,
            child:Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(item.icon),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 23,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      item.iconText,
                      style: TextStyle(color: Colors.white, fontSize: SizeConfig.blockSizeHorizontal * 4),
                    )
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
