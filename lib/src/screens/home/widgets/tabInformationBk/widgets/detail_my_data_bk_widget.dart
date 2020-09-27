// ignore: unused_import
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
// ignore: unused_import
import 'package:bkapp_flutter/src/utils/home_routes_constants.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
// ignore: unused_import
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DetailMyDataBkWidget extends StatelessWidget {
  final Personal information;
  DetailMyDataBkWidget({Key key, this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(10),
                        topLeft: const Radius.circular(10)),
                    color: Theme.of(context).colorScheme.primaryColor[100]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(information.earnings,
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4,
                                      fontWeight: FontWeight.w100)),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        SizeConfig.blockSizeVertical * 0.6),
                                child: RichText(
                                  text: TextSpan(
                                      text: I18n.of(context).homeScreenMy,
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                3.7,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              ' ${I18n.of(context).homeScreenEarnings}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: SizeConfig.safeBlockVertical * 4,
                              right: SizeConfig.safeBlockHorizontal * 7),
                          child: SvgPicture.asset('assets/images/path.svg',
                              fit: BoxFit.contain),
                        ))
                  ],
                )),
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
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          // context.bloc<MenuNavigatorBloc>().add(ButtonPressed(goTo: HomeRoutesConstant.activeCreditScreen));
                        },
                        child: Container(
                            width: SizeConfig.blockSizeHorizontal * 50,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                      text: TextSpan(
                                          text: I18n.of(context).homeScreenMe,
                                          style: TextStyle(
                                            fontSize: 13,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w200,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .grayColor,
                                          ),
                                          children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              ' ${I18n.of(context).homeScreenCredit}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ])),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            SizeConfig.safeBlockVertical * 0.8),
                                    child: Text(information.activeCredit,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .grayColor[200],
                                            letterSpacing: 1.5,
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    2,
                                            fontWeight: FontWeight.w100)),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          // context.bloc<MenuNavigatorBloc>().add(ButtonPressed(
                          //     goTo: HomeRoutesConstant.timeLineMyShares));
                        },
                        child: Container(
                            width: SizeConfig.blockSizeHorizontal * 50,
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(
                                        text: I18n.of(context).homeScreenMy,
                                        style: TextStyle(
                                          fontSize: 13,
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.w200,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .grayColor,
                                        ),
                                        children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            ' ${I18n.of(context).homeScreenShares}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ])),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.safeBlockVertical * 0.8),
                                  child: Text(information.shares,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .grayColor[200],
                                          letterSpacing: 1.5,
                                          fontSize:
                                              SizeConfig.safeBlockVertical * 2,
                                          fontWeight: FontWeight.w100)),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
