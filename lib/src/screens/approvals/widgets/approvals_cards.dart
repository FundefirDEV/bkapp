import 'package:bkapp_flutter/src/screens/approvals/content/request_card.dart';
import 'package:bkapp_flutter/src/screens/approvals/content/request_partner_card.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class ApprovalsCards extends StatefulWidget {
  ApprovalsCards(
      {Key key,
      @required this.data,
      this.title,
      @required this.token,
      this.type,
      this.role})
      : super(key: key);

  final List data;
  final String title;
  final String token;
  final String type;
  final String role;

  @override
  _ApprovalsCardsState createState() => _ApprovalsCardsState();
}

class _ApprovalsCardsState extends State<ApprovalsCards> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: widget.data.length > 0
          ? Column(
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20.0),
                Carousel(
                  heigthContainer: 140,
                  viewportFraction: 0.5,
                  currentPage: 0,
                  children: <Widget>[
                    for (var i = 0; i < widget.data.length; i++)
                      widget.role == 'admin'
                          ? RequestShareCard(
                              index: i,
                              key: Key('request-share-card-$i'),
                              id: int.parse(widget.data[i]['id'].toString()),
                              partnerName: UtilsTools.titleCase(
                                  widget.data[i]['partnerName']),
                              amount: double.parse(
                                  widget.data[i]['amount'].toString()),
                              quantity: widget.data[i]['quantity'] != null
                                  ? int.parse(
                                      widget.data[i]['quantity'].toString())
                                  : 0,
                              requestDate: widget.data[i]['requestDate'],
                              token: widget.token,
                              type: widget.type,
                              role: widget.role,
                            )
                          : RequestPartnerCard(
                              partnerName: UtilsTools.titleCase(
                                  widget.data[i]['partnerName']),
                              amount: double.parse(
                                  widget.data[i]['amount'].toString()),
                              quantity: widget.data[i]['quantity'] != null
                                  ? int.parse(
                                      widget.data[i]['quantity'].toString())
                                  : 0,
                              type: widget.type,
                            )
                  ],
                )
              ],
            )
          : null,
    );
  }
}
