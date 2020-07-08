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

    return AppBarWidget(
      container: Column(
          key: Key('Column-appbar-approvals-screen'),
          children: <Widget>[
            TitleApprovalsWidget(),
            CardApprovals(
              childBlue: NumberPetitions(),
              childWhite: AcceptedDiscarted()
            ),
            separationContainer(context),
            buildScroolable()
          ],
        ),
    );
  }

  Container separationContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.0),
      height: SizeConfig.safeBlockVertical * 3,
      color: Theme.of(context).colorScheme.grayColor[100],
    );
  }

  Widget buildScroolable() {
    return Container(
      key: Key('Main-container-scroolable-approvals-screen'),
      color: Theme.of(context).colorScheme.grayColor[100],
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
          SizedBox(height: 20.0),
          sharesExample.length > 0
              ? Carousel(
                heigthContainer: 150.0,
                viewportFraction:
                    SizeConfig.blockSizeHorizontal * 0.1,
                children: <Widget>[
                  for (var i = 0; i < sharesExample.length; i++)
                    RequestShareCard(
                        partnerName: sharesExample[i]["name"],
                        price: sharesExample[i]["price"],
                        quantity: sharesExample[i]["quantity"],
                        requesType: sharesExample[i]["type"]),
                ],
              )
              : noDataContainer(),
          SizedBox(height: 20.0),
          Text(
            I18n.of(context).approvalsScreenCredits,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20.0),
          creditExample.length > 0
              ? Carousel(
                heigthContainer: 150.0,
                viewportFraction:
                    SizeConfig.blockSizeHorizontal * 0.1,
                children: <Widget>[
                  for (var i = 0; i < creditExample.length; i++)
                    RequestShareCard(
                        partnerName: creditExample[i]["name"],
                        price: creditExample[i]["price"],
                        quantity: creditExample[i]["quantity"],
                        requesType: creditExample[i]["type"]),
                ],
              )
              : noDataContainer(),
          SizedBox(height: 20.0),
          Text(
            I18n.of(context).approvalsScreenPayments,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20.0),
          creditExample.length > 0
              ? Carousel(
                heigthContainer: 150.0,
                viewportFraction:
                    SizeConfig.blockSizeHorizontal * 0.1,
                children: <Widget>[
                  for (var i = 0; i < paymentExample.length; i++)
                    RequestShareCard(
                        partnerName: paymentExample[i]["name"],
                        price: paymentExample[i]["price"],
                        quantity: paymentExample[i]["quantity"],
                        requesType: paymentExample[i]["type"]),
                ],
              )
              : noDataContainer(),
          SizedBox(height: 20.0),
        ],
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
}
