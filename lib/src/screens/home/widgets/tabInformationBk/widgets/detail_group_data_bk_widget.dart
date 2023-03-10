import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DetailGroupDataBkWidget extends StatelessWidget {
  final Group information;
  DetailGroupDataBkWidget({Key key, this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final navigateBloc = context.read<MenuNavigatorBloc>();

    final sizeTitle = SizeConfig.safeBlockHorizontal * 3.5;
    final sizeTitleValue = sizeTitle * 1.5;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5),
      child: Column(
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
                              key: Key('group-bk-title-cashbalance'),
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w800,
                                  fontSize: sizeTitle,
                                  color:
                                      Theme.of(context).colorScheme.grayColor),
                            ),
                            Text(information.cashBalance,
                                key: Key('group-bk-value-cashbalance'),
                                style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: sizeTitleValue,
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
                        child: GestureDetector(
                          onTap: () => navigateBloc.add(ButtonPressed(
                            goTo: HomeRoutesConstant.reportsScreen)
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical * 4,
                                horizontal: SizeConfig.safeBlockHorizontal * 7),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryColor[100],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(10))),
                            child: SvgPicture.asset('assets/images/path.svg',
                                fit: BoxFit.contain),
                          ),
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(I18n.of(context).homeScreenShares,
                                key: Key('group-bk-title-shares'),
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: sizeTitle,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      Theme.of(context).colorScheme.grayColor,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 0.8),
                              child: Text(information.shares,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .grayColor[200],
                                      letterSpacing: 1.5,
                                      fontSize: sizeTitleValue,
                                      fontWeight: FontWeight.w100)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(I18n.of(context).homeScreenBorrowed,
                                key: Key('group-bk-title-creditsgranted'),
                                style: TextStyle(
                                  fontSize: sizeTitle,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 0.8),
                              child: Text(information.activeCredits,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .grayColor[200],
                                      letterSpacing: 1.5,
                                      fontSize: sizeTitleValue,
                                      fontWeight: FontWeight.w100)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
