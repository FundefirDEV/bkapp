import 'package:bkapp_flutter/src/screens/approvals/content/request_card.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/carousel/carousel_widget.dart';
import 'package:flutter/material.dart';

class ApprovalsCards extends StatefulWidget {
  ApprovalsCards(
      {Key key,
      @required this.data,
      @required this.emptyData,
      this.title,
      this.modalConfirm})
      : super(key: key);

  final List data;
  final Widget emptyData;
  final String title;
  final Function modalConfirm;

  @override
  _ApprovalsCardsState createState() => _ApprovalsCardsState();
}

class _ApprovalsCardsState extends State<ApprovalsCards> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20.0),
          widget.data.length > 0
              ? Carousel(
                  heigthContainer: SizeConfig.blockSizeVertical * 25,
                  viewportFraction: SizeConfig.blockSizeHorizontal * 0.15,
                  currentPage: 0,
                  children: <Widget>[
                    for (var i = 0; i < widget.data.length; i++)
                      RequestShareCard(
                        index: i,
                        id: widget.data[i]['id'],
                        partnerName: widget.data[i]['partnerName'],
                        amount: widget.data[i]['amount'],
                        quantity: widget.data[i]['quantity'] != null
                            ? widget.data[i]['quantity']
                            : null,
                        requestDate: widget.data[i]['requestDate'],
                        modalConfirm: widget.modalConfirm,
                      ),
                  ],
                )
              : widget.emptyData,
        ],
      ),
    );
  }
}
