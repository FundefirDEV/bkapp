import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/home/widgets/optionsBk/widgets/rotating_options_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionsBkWidget extends StatelessWidget {
  final double heightCard = SizeConfig.blockSizeVertical * 20;
  final BorderRadiusGeometry radiusCard = BorderRadius.circular(10);
  final double sizeTitleCard = SizeConfig.safeBlockHorizontal * 3.5;
  final double letterSpacingTitle = 1.5;
  final double spaceTopTitleCard = SizeConfig.blockSizeVertical * 3.5;

  OptionsBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        RotatingOptionsWidget(),
        Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: SizeConfig.blockSizeHorizontal * 52,
                    height: heightCard,
                    decoration: BoxDecoration(
                        borderRadius: radiusCard, color: Colors.white),
                    child: Stack(
                      children: <Widget>[
                        new Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: const Radius.circular(10),
                                    bottomLeft: const Radius.circular(10)),
                                child: SvgPicture.asset(
                                    'assets/images/charts_image.svg',
                                    fit: BoxFit.cover),
                              ),
                            )),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: spaceTopTitleCard),
                            child: Text(I18n.of(context).homeScreenReports,
                                style: TextStyle(
                                    letterSpacing: letterSpacingTitle,
                                    color:
                                        Theme.of(context).colorScheme.grayColor,
                                    fontSize: sizeTitleCard,
                                    fontWeight: FontWeight.w100)))
                      ],
                    )),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 3),
                      height: heightCard,
                      decoration: BoxDecoration(
                          borderRadius: radiusCard, color: Colors.white),
                      child: Stack(
                        children: <Widget>[
                          new Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: const Radius.circular(10)),
                                  child: SvgPicture.asset(
                                      'assets/images/partners_image.svg'),
                                ),
                              )),
                          Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3.5),
                              child: Text(I18n.of(context).homeScreenPartners,
                                  style: TextStyle(
                                      letterSpacing: letterSpacingTitle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .grayColor,
                                      fontSize: sizeTitleCard,
                                      fontWeight: FontWeight.w100)))
                        ],
                      )),
                ),
              ],
            ))
      ],
    ));
  }
}