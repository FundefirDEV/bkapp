import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

class SharesRulesContainer extends StatelessWidget {
  const SharesRulesContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      key: Key('container_shares_rules'),
      height: SizeConfig.blockSizeVertical * 12,
      width: SizeConfig.blockSizeHorizontal * 40,
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        right: SizeConfig.blockSizeHorizontal * 8,
        left: SizeConfig.blockSizeHorizontal * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.grayColor.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: sharesColumn(context),
    );
  }
}

Column sharesColumn(context) {
  return Column(
    key: Key('column_shares_rules'),
    children: <Widget>[
      SizedBox(height: SizeConfig.blockSizeVertical * 2),
      Container(
        key: Key('top_container_shares_rules'),
        child: Row(children: <Widget>[
          SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
          Icon(Icons.attach_money,
              color: Theme.of(context).colorScheme.grayColor.withOpacity(0.5)),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
          Text(I18n.of(context).rulesScreenShares,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.grayColor[400],
                  fontSize: 14))
        ]),
        //alignment: Alignment(-0.8, -1.0),
      ),
      Container(
        key: Key('bottom_container_shares_rules'),
        margin: EdgeInsets.only(top: 10),
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: I18n.of(context).rulesScreenSharesValue + '\n',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.grayColor[300],
                    fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: '10.000',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.grayColor[200],
                          fontSize: 12))
                ])),
        alignment: Alignment(-0.7, -1.0),
      ),
    ],
  );
}
