import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class DetailGroupDataBkWidget extends StatelessWidget {
  DetailGroupDataBkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(10),
                      topLeft: const Radius.circular(10)),
                  color: Colors.white),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            I18n.of(context).homeScreenBox,
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.grayColor),
                          ),
                          Text(r'$500.000',
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: 24,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .grayColor[200],
                                  fontWeight: FontWeight.w100))
                        ],
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 4,
                            horizontal: SizeConfig.safeBlockHorizontal * 7),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryColor[100],
                            borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(10))),
                        child: SvgPicture.asset('assets/images/path.svg',
                            fit: BoxFit.contain),
                      ))
                ],
              )),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 4),
          child: LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.red,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primaryColor[100])),
        ),
        Flexible(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockVertical * 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10),
                      bottomRight: const Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(I18n.of(context).homeScreenShares,
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.grayColor,
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 0.8),
                          child: Text(r'50',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .grayColor[200],
                                  letterSpacing: 1.5,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100)),
                        )
                      ],
                    )),
                  ),
                  Expanded(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(I18n.of(context).homeScreenBorrowed,
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 0.8),
                          child: Text(r'$0',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .grayColor[200],
                                  letterSpacing: 1.5,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100)),
                        )
                      ],
                    )),
                  )
                ],
              )),
        )
      ],
    );
  }
}
