import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget {
  final Widget container;
  AppBarWidget({Key key, this.container}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
        child: Container(
            color: Theme.of(context).colorScheme.grayColor[100],
            child: Stack(children: <Widget>[
              new Positioned(
                  top: 0,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 45,
                    child: SvgPicture.asset('assets/images/oval_top.svg',
                        fit: BoxFit.cover),
                  )),
              SafeArea(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 6),
                      child: Column(children: <Widget>[
                        _header(),
                        Expanded(
                            child: SingleChildScrollView(child: this.container))
                      ])))
            ])));
  }

  Container _header() {
    return Container(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2.5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                key: Key('icon-salito'),
                child: SvgPicture.asset('assets/images/salo_bot.svg',
                    fit: BoxFit.cover)),
            Container(
                key: Key('text-name'),
                child: Text('Enrique Angrisano',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontWeight: FontWeight.w100))),
            Container(
                key: Key('button-logout'),
                child: SvgPicture.asset('assets/images/icon_exit.svg',
                    fit: BoxFit.cover)),
          ],
        ));
  }
}
