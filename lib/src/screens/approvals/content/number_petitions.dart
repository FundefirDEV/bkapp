import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class NumberPetitions extends StatelessWidget {
  const NumberPetitions({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenCashBalance,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 12),
                ),
                Text(
                  data['cashBalance'].toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  I18n.of(context).approvalsScreenCreditRequested,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 12),
                ),
                Text(
                  data['totalCreditRequest'].toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
