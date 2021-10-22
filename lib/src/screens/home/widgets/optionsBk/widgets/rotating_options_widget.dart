import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RotatingOptionsWidget extends StatelessWidget {
  RotatingOptionsWidget({Key key}) : super(key: key);

  final double heightCard = SizeConfig.blockSizeVertical * 20;
  final BorderRadiusGeometry radiusCard = BorderRadius.circular(10);
  final double sizeTitleCard = SizeConfig.safeBlockHorizontal * 3.5;
  final double letterSpacingTitle = 1.5;
  final double spaceTopTitleCard = SizeConfig.blockSizeVertical * 3.5;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final navigateBloc = context.read<MenuNavigatorBloc>();

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
              margin: EdgeInsets.only(right: 5),
              height: heightCard,
              decoration:
                  BoxDecoration(borderRadius: radiusCard, color: Colors.white),
              child: Stack(
                children: <Widget>[
                  new Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(10)),
                          child: SvgPicture.asset(
                              'assets/images/shopping_cart.svg'),
                        ),
                      )),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: spaceTopTitleCard),
                      child: Text(I18n.of(context).homeScreenMarket,
                          style: TextStyle(
                              letterSpacing: letterSpacingTitle,
                              color: Theme.of(context).colorScheme.grayColor,
                              fontSize: sizeTitleCard,
                              fontWeight: FontWeight.w100))),
                  InkWell(
                      // onTap: () => navigateBloc.add(ButtonPressed(
                      //     goTo: HomeRoutesConstant.adminCreateBankScreen)),
                      ),
                ],
              )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: heightCard,
              decoration:
                  BoxDecoration(borderRadius: radiusCard, color: Colors.white),
              child: Stack(
                children: <Widget>[
                  new Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(10)),
                          child:
                              SvgPicture.asset('assets/images/blue_money.svg'),
                        ),
                      )),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: spaceTopTitleCard),
                      child: Column(
                        children: <Widget>[
                          Text(I18n.of(context).homeScreenCredits,
                              style: TextStyle(
                                  letterSpacing: letterSpacingTitle,
                                  color:
                                      Theme.of(context).colorScheme.grayColor,
                                  fontSize: sizeTitleCard,
                                  fontWeight: FontWeight.w100)),
                          Text('Fundefir',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .grayColor[200],
                                  fontSize: sizeTitleCard,
                                  fontWeight: FontWeight.w700))
                        ],
                      ))
                ],
              )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(left: 5),
              height: heightCard,
              decoration:
                  BoxDecoration(borderRadius: radiusCard, color: Colors.white),
              child: Stack(
                children: <Widget>[
                  new Positioned(
                      bottom: -8,
                      right: 0,
                      left: 0,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(10)),
                          child: SvgPicture.asset('assets/images/lamp.svg'),
                        ),
                      )),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: spaceTopTitleCard),
                      child: Text(I18n.of(context).homeScreenTips,
                          style: TextStyle(
                              letterSpacing: letterSpacingTitle,
                              color: Theme.of(context).colorScheme.grayColor,
                              fontSize: sizeTitleCard,
                              fontWeight: FontWeight.w100)))
                ],
              )),
        ),
      ],
    ));
  }
}
