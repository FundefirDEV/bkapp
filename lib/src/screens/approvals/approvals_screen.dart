import 'dart:convert';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/card_approvals.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/number_petitions.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/request_card.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'content/accepted_discarted_container.dart';
import 'content/title_approve_screen.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class ApprovalsScreen extends StatefulWidget {
  ApprovalsScreen({Key key}) : super(key: key);

  @override
  _ApprovalsScreenState createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  List sharesExample = jsonDecode(
      '[{"name":"Marcos Nope","type":"acciones","price":"20000.0","quantity":"2"},{"name":"Gibran Raydan","type":"acciones","price":"30000.0","quantity":"3"},{"name":"Daniel Tavera","type":"acciones","price":"30000.0","quantity":"3"}]');
  List creditExample = jsonDecode(
      '[{"name":"Marcos Nope","type":"crédito","price":"200000.0", "quantity":"1"},{"name":"Gibran Raydan","type":"crédito","price":"300000.0", "quantity":"1"},{"name":"Daniel Tavera","type":"crédito","price":"30000.0", "quantity":"1"}]');
  List paymentExample = jsonDecode(
      '[{"name":"Marcos Nope","type":"pago","price":"200000.0", "quantity":"1"},{"name":"Gibran Raydan","type":"pago","price":"300000.0", "quantity":"1"},{"name":"Daniel Tavera","type":"pago","price":"30000.0", "quantity":"1"}]');
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('Scaffold-approvals-screen'),
      body: SafeArea(
          key: Key('SafeArea-approvals-screen'),
          child: Column(
              key: Key('Main-column-approvals-screen'),
              children: <Widget>[
                buildAppBarWidget(),
                separationContainer(context),
                buildScroolable(),
              ])),
    );
  }

  Container separationContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.0),
      height: SizeConfig.safeBlockVertical * 3,
      color: Theme.of(context).colorScheme.grayColor[100],
    );
  }

  Expanded buildScroolable() {
    return Expanded(
      key: Key('Expanded-scroolable-approvals-screen'),
      child: Container(
        key: Key('Main-container-scroolable-approvals-screen'),
        color: Theme.of(context).colorScheme.grayColor[100],
        child: SingleChildScrollView(
            key: Key('Scroolable-approvals-screen'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenShares,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                separationContainer(context),
                sharesExample.length > 0
                    ? Container(
                        key:
                            Key('Container-scroolable-shares-approvals-screen'),
                        height: SizeConfig.blockSizeVertical * 20,
                        child: Carousel(
                          viewportFraction:
                              SizeConfig.blockSizeHorizontal * 0.09,
                          children: <Widget>[
                            for (var i = 0; i < sharesExample.length; i++)
                              RequestShareCard(
                                  partnerName: sharesExample[i]["name"],
                                  price: sharesExample[i]["price"],
                                  quantity: sharesExample[i]["quantity"],
                                  requesType: sharesExample[i]["type"]),
                          ],
                        ))
                    : noDataContainer(),
                separationContainer(context),
                Text(
                  I18n.of(context).approvalsScreenCredits,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                separationContainer(context),
                creditExample.length > 0
                    ? Container(
                        key: Key(
                            'Container-scroolable-credits-approvals-screen'),
                        height: SizeConfig.blockSizeVertical * 20,
                        child: Carousel(
                          viewportFraction:
                              SizeConfig.blockSizeHorizontal * 0.09,
                          children: <Widget>[
                            for (var i = 0; i < creditExample.length; i++)
                              RequestShareCard(
                                  partnerName: creditExample[i]["name"],
                                  price: creditExample[i]["price"],
                                  quantity: creditExample[i]["quantity"],
                                  requesType: creditExample[i]["type"]),
                          ],
                        ))
                    : noDataContainer(),
                separationContainer(context),
                Text(
                  I18n.of(context).approvalsScreenPayments,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                separationContainer(context),
                creditExample.length > 0
                    ? Container(
                        key: Key(
                            'Container-scroolable-payment-approvals-screen'),
                        height: SizeConfig.blockSizeVertical * 20,
                        child: Carousel(
                          viewportFraction:
                              SizeConfig.blockSizeHorizontal * 0.09,
                          children: <Widget>[
                            for (var i = 0; i < paymentExample.length; i++)
                              RequestShareCard(
                                  partnerName: paymentExample[i]["name"],
                                  price: paymentExample[i]["price"],
                                  quantity: paymentExample[i]["quantity"],
                                  requesType: paymentExample[i]["type"]),
                          ],
                        ))
                    : noDataContainer(),
                separationContainer(context),
              ],
            )),
      ),
    );
  }

  Container noDataContainer() {
    return Container(
        child: Text(
      I18n.of(context).approvalsScreenNoRequest,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    ));
  }

  AppBarWidget buildAppBarWidget() {
    return AppBarWidget(
        key: Key('Appbar-approvals-screen'),
        container: Container(
          key: Key('Container-appbar-approvals-screen'),
          child: Column(
            key: Key('Column-appbar-approvals-screen'),
            children: <Widget>[
              TitleApprovalsWidget(),
              CardApprovals(
                  childBlue: NumberPetitions(),
                  childWhite: AcceptedDiscarted()),
            ],
          ),
        ));
  }
}
